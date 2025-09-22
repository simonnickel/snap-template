//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapSettingsService
import SnapDependencies

public struct ConfigureTabsScreen: View {
	
    @Dependency(\.settingsService) private var settings
    @Dependency(\.tabConfigurationDefault) private var tabConfigurationDefault

	public init() {}
	
	@State private var tabsSetting: SettingsService.Value<TabConfiguration?>?
	
	public var body: some View {
		
		Group {
			if let tabsSetting {
				TabList(tabsSetting: tabsSetting, defaultConfiguration: tabConfigurationDefault)
			} else {
                Text("Empty")
                // TODO feature: Generic Empty / Error View
//				ThemeEmptyDecorationView(text: "Tab Configuration not loaded")
			}
		}
		.onAppear() {
			tabsSetting = settings.value(.navigationTabs)
		}
		
	}
	
}


// MARK: - Previews

#Preview {
    let tab1 = TabConfiguration.Tab(id: "Tab1", name: "Tab1")
    let tab2 = TabConfiguration.Tab(id: "Tab2", name: "Tab2")
    
    Dependencies.override(\.tabConfigurationDefault) {
        TabConfiguration(
            tabs: [tab1, tab2],
            required: [],
            disabled: [],
            initial: tab1
        )
    }
	
	return ConfigureTabsScreen()
        .environment(\.serviceSettings, SettingsService())
}
