//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapSettingsService
import SnapDependencies

// TODO: Necessary?
public struct SettingsToggle: View {
		
	@Dependency(\.settingsService) private var settings
	
	private let title: String
	
	private let setting: SettingsService.Value<Bool>
	
	public init(title: String, setting: SettingsService.Value<Bool>) {
		self.title = title
		self.setting = setting
	}
	
	public var body: some View {
		
		ToggleTapable(isOn: setting.binding) {
			Text(title)
		}
		
	}
	
}


