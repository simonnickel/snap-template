//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapSettingsService
import SnapDependencies
import SnapStyle

public protocol PickableSetting: Identifiable, Codable, Hashable, Sendable, CaseIterable where AllCases == Array<Self> {
	
	static var title: String { get }
	var title: String { get }
	
}

public struct SettingsPicker<Setting: PickableSetting>: View {
		
	@Dependency(\.settingsService) private var settings
	
	private let setting: SettingsService.Value<Setting>
	
	public init(setting: SettingsService.Value<Setting>) {
		self.setting = setting
	}
	
	public var body: some View {
        
        StyleListRow(.pickInline(Setting.allCases, titleKeyPath: \.title, selection: setting.binding)) {
            Text(Setting.title)
        }
		
	}
	
}
