//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapStyle
import SnapSettingsService

public enum TemplateSettingsDestination: SnapNavigationDestination {
	
	case settingsScreen
    case tabConfiguration

	public var definition: SnapNavigation.ScreenDefinition {
		switch self {
            case .settingsScreen: .init(title: "Settings", icon: \SnapStyle.IconKey.settings, style: .modal) { TemplateSettingsScreen() }
			case .tabConfiguration: .init(title: "Configure Tabs", icon: \SnapStyle.IconKey.settingsTabs) {
				
				// TODO: Inject default config, e.g. by defining a SnapNavigationScreen as generic.
//				static var tabConfigDefault: TabConfiguration { TabConfiguration(tabs: AppDestination.tabsAvailable.configArray, required: AppDestination.tabsRequired.configSet, disabled: AppDestination.tabsDisabledByDefault.configSet, initial: AppDestination.initial.configTab) }
                ConfigureTabsScreen(defaultConfiguration: .init(tabs: [], required: [], disabled: [], initial: nil))
			}
		}
	}
    
    
    // MARK: Identifiable
    
    public var id: Self { self }
    
	
	// MARK: Definition Overrides

	@MainActor
	public var label: any View {
		return StyleLabel(definition.title, icon: icon)
	}
	
	@MainActor
	public var destination: any View {
		definition.destination?() ?? EmptyView()
	}
	
}
