//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapSettingsService
import SnapTemplateUtil
import SnapStyle
import SwiftUI

// TODO Localization

public struct TemplateSettingsScreen: View {
	
	public init() {}
	
	@Dependency(\.settingsService) private var settings
	
	public var body: some View {
        StyleList {
            
            SettingsHeaderSection(name: "I am Simon Nickel", text: "I hope you enjoy using this template as much as I enjoy creating it!")
            
            Section {
                
                StyleListRow(
                    title: {
                        Text("Accent Color")
                    },
                    content: {
                        AccentColorPicker(
                            setting: settings.value(.accent)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                )
                
                // TODO: Segmented instead of Picker?
                
                SettingsPicker(setting: settings.value(.displayMode))
                
                SettingsPicker(setting: settings.value(.interfaceScale))
                
            } header: {
                Text("Appearance")
                    .styleListSectionHeaderLabel()
            }
            
            Section {
                
                SettingsPicker(setting: settings.value(.navigationLayout))
                
                NavigationListRow(destination: TemplateSettingsDestination.tabConfiguration)
                
            } header: {
                Text("Navigation")
                    .styleListSectionHeaderLabel()
            }
            
        }
        .navigationTitle("Settings") // TODO: Part of Navigation / Screen definition?
        
    }
    
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		TemplateSettingsScreen()
		
	}
	
}
