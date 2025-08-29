//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapSettingsService
import SnapStyle

public extension SettingsService.SettingDefinition {
    
    public static let accent = SettingsService.Setting<AccentOption?>("Settings.Appearance.accent", in: .ubiquitous, default: nil)
	
}
