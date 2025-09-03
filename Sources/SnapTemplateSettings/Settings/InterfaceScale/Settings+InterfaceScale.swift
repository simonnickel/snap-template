//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
	static let interfaceScale = SettingsService.Setting<InterfaceScale>("Settings.Appearance.InterfaceScale", in: .defaults, default: .medium)
	
}
