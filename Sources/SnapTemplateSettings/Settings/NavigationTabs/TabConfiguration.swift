//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif
import SnapCore
import SnapStyle

public struct TabConfiguration: Codable, Equatable, Hashable, Sendable {
    
    public typealias IconMapping = [Tab.ID : Style.IconKey.ValueBuilderKeyPath]
	
	public struct Tab: Identifiable, Codable, Equatable, Hashable, Sendable {
		
		public let id: String
		public let name: String

		public init(id: String, name: String) {
			self.id = id
			self.name = name
		}
		
	}
	
	public let tabs: [Tab]
	
	public let required: Set<Tab>
	
	public let disabled: Set<Tab>
	
	public let initial: Tab?
	
	public init(tabs: [TabConfiguration.Tab], required: Set<Tab>, disabled: Set<Tab>, initial: Tab?) {
		self.tabs = tabs
		self.required = required
		self.disabled = disabled
		self.initial = initial
	}
	
	public func updated(tabs: [TabConfiguration.Tab]? = nil, required: Set<Tab>? = nil, disabled: Set<Tab>? = nil, initial: Tab? = nil) -> TabConfiguration {
		TabConfiguration(tabs: tabs ?? self.tabs, required: required ?? self.required, disabled: disabled ?? self.disabled, initial: initial ?? self.initial)
	}
	
	/// Add available tabs that are not part of the configuration and remove tabs no longer available.
	public func updated(withDefaults defaultConfig: TabConfiguration) -> TabConfiguration {
		// Remove tabs no longer available, add tabs that were not available to the configuration before.
		let tabs = self.tabs.filter({ defaultConfig.tabs.contains($0) }).appendedUnique(defaultConfig.tabs)
		// Remove required tabs no longer available, add required tabs that were not available to the configuration before.
		let required = self.required.filter({ defaultConfig.required.contains($0) }).inserted(defaultConfig.required)
		// Add disabled tabs that were not available to the configuration before.
		let disabled = self.disabled.inserted(defaultConfig.disabled.filter({ !self.tabs.contains($0) }))
		return self.updated(tabs: tabs, required: required, disabled: disabled)
	}
	
	public func positionInTabBar(_ tab: TabConfiguration.Tab) -> Int {
		let enabled = tabs.filter({ !disabled.contains($0) || required.contains($0) }) // Check for required in case of definition change after configuration was created.
		return enabled.firstIndex(of: tab) ?? -1
	}
	
	/// TabView limits visible tabs (iPhone: 5, iPad: 8 but 5 when in SplitView). Additional tabs would be displayed in a list under the `more` tab. Should be avoided as this list can not be modified and has its own NavigationStack.
	/// TODO idea: Custom 'more' tab to dynamically adjust to iPad in full screen vs. split view.
	/// TODO macOS: check tab bar behaviour.
	@MainActor
	private var maxNumberOfTabsToShow: Int {
#if canImport(UIKit)
		return switch UIScreen.main.traitCollection.userInterfaceIdiom {
			case .phone, .pad: 5
			case .mac: 8
			case .unspecified, .tv, .carPlay, .vision: 5
			@unknown default: 5
		}
#else
		return 8
#endif
	}
	
	@MainActor
	public func isVisible(_ tab: TabConfiguration.Tab) -> Bool {
		let maxNumberOfTabsToShow = maxNumberOfTabsToShow
		let positionInTabBar = positionInTabBar(tab)

		if required.contains(tab) {
			let requiredBefore = positionInTabBar > 0 ? (tabs.filter({ required.contains($0) }).firstIndex(of: tab) ?? 0) : 0
			return requiredBefore < maxNumberOfTabsToShow
		}
		
		let tabsAfter = positionInTabBar > 0 ? Array(tabs.dropFirst(positionInTabBar)) : tabs
		let numberOfRequiredTabsAfter = tabsAfter.filter({ required.contains($0) }).count
		
		return positionInTabBar >= 0 && positionInTabBar < (maxNumberOfTabsToShow - numberOfRequiredTabsAfter)
	}
	
	@MainActor
	public var visibleTabs: [TabConfiguration.Tab] {
		tabs.filter({ isVisible($0) })
	}
	
}

