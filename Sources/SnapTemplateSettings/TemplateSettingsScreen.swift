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

// Missing Localisation

public struct TemplateSettingsScreen: View {
	
	public init() {}
	
	@Dependency(\.settingsService) private var settings
    
    // TODO: Background of sheet should have a different Dark Mode color than the view behind the sheet.
	
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
                    }
                )
                
                SettingsPickerRow(setting: settings.value(.displayMode))
                
                SettingsPickerRow(setting: settings.value(.interfaceScale))
                
            } header: {
                Text("Appearance")
                    .styleListSectionHeaderLabel()
            }
            
            Section {
                
                SettingsPickerRow(setting: settings.value(.navigationLayout))
                
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
