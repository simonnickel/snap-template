//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let navigationLayout = SettingsService.Setting<NavigationLayout>("Settings.Appearance.NavigationLayout", in: .defaults, default: .defaultValue)
	
}

