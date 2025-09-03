//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService

public extension SettingsService.SettingDefinition {
	
    static let navigationTabs = SettingsService.Setting<TabConfiguration?>("Settings.Appearance.navigationTabs", in: .defaults, default: nil)
	
}
