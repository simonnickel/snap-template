//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapSettingsService
import SnapTemplateUtil
import SnapTheme
import SwiftUI

// TODO Localization

public struct TemplateSettingsScreen: View {
	
	public init() {}
	
	@Dependency(\.settingsService) private var settings
	
	// TODO: Does not work anymore. See comment below
	private let navSelectionState = ListNavState<TemplateSettingsDestination>()
	
	public var body: some View {
			
		ThemeSceneSettings(title: "Settings") {
			
			SettingsHeaderSection(name: "I am Simon Nickel", text: "I hope you enjoy using this template as much as I do enjoy creating it!")
			
			Section {
				
				SettingsRow(title: "Accent Color") {
					AccentColorPicker(
						setting: settings.value(.accent)
					)
					.frame(maxWidth: .infinity, alignment: .center)
				}
				
				SettingsRow(title: DisplayMode.title) {
					SettingsPicker(setting: settings.value(.displayMode))
				}
				
				SettingsRow(title: InterfaceScale.title) {
					SettingsPicker(setting: settings.value(.interfaceScale))
				}
				
			} header: {
				ThemeLabel(text: "Appearance", style: .themeSectionHeader())
			}
			
			Section {
				
				SettingsRow(title: NavigationLayout.title) {
					SettingsPicker(setting: settings.value(.navigationLayout))
				}
				
                NavigationListRow(destination: TemplateSettingsDestination.tabs)

				ThemeListRowNavigationLink(value: TemplateSettingsDestination.tabs, state: navSelectionState) {
					ThemeLabel(text: "Configure Tab Bar", style: .themeListRow())
				}
				
			} header: {
				ThemeLabel(text: "Navigation", style: .themeSectionHeader())
			}
			
		}
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		TemplateSettingsScreen()
		
	}
	
}
