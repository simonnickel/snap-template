//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapStyle
import SnapSettingsService

extension ConfigureTabsScreen {
	
	struct TabList: View {
		
		let tabsSetting: SettingsService.Value<TabConfiguration?>
		let defaultConfiguration: TabConfiguration
		
		private var tabs: [TabConfiguration.Tab] {
			let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
			return configuration.tabs
		}
		
		var body: some View {
			StyleList {
				
				Section {
					ForEach(tabs) { tab in
						ListRow(
							tab: tab,
							tabsSetting: tabsSetting,
							defaultConfiguration: defaultConfiguration
						)
					}
					.onMove { from, to in
						var tabs = tabs
						tabs.move(fromOffsets: from, toOffset: to)
						
						let configuration = tabsSetting.value ?? defaultConfiguration
						tabsSetting.set(configuration.updated(tabs: tabs))
					}
				} footer: {
					// TODO Localization
                    // TODO: .footnote? / .info / .footer
                    // TODO: inset
					StyleLabel("First 5 tabs are displayed.")
                        .style(element: .label)
				}
				
                // TODO: When initial selection no longer is available -> choose one of the existing ones.
				Section {
					let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
					let options = configuration.tabs
						.filter({ tab in
							configuration.isVisible(tab)
						})
					if let initial = configuration.initial ?? defaultConfiguration.initial ?? options.first {
                        InitialTabPickerRow(
                            options: options,
                            selected: initial,
                            tabsSetting: tabsSetting,
                            defaultConfiguration: defaultConfiguration
                        )
					}
				}
				
				if tabsSetting.value != nil && tabsSetting.value != defaultConfiguration {
					// TODO Localization
                
                    // TODO: Styling as .action or as no background and button inside.
                    StyleListRow {
                        StyleButton {
                            tabsSetting.set(nil)
                        } content: {
                            Text("Reset") // TODO: Styling
                        }
                    }
				}
				
			}
#if !os(macOS) // TODO macOS
			.environment(\.editMode, .constant(.active))
#endif
		}
	}
	
}
