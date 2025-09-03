//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let displayMode = SettingsService.Setting<DisplayMode>("Settings.Appearance.DisplayMode", in: .defaults, default: .system)
	
}
