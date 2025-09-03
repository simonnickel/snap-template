//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapSettingsService
import SnapStyle

extension ConfigureTabsScreen {
	
	struct InitialTabPickerRow: View {
		
		let options: [TabConfiguration.Tab]
		@State var selected: TabConfiguration.Tab
		let tabsSetting: SettingsService.Value<TabConfiguration?>
		let defaultConfiguration: TabConfiguration
		
		public var body: some View {
            // TODO FB12181540: Should be able to apply color and font to Picker.
            StyleListRow(.pick(options, titleKeyPath: \.name, selection: $selected), title: {
                // TODO Localization
                Text("Initial Tab")
            })
			.onChange(of: selected) { oldValue, newValue in
				let configuration = tabsSetting.value ?? defaultConfiguration
				tabsSetting.set(configuration.updated(initial: newValue))
			}
			.onChange(of: tabsSetting.value) { oldValue, newValue in
				if let initial = (tabsSetting.value ?? defaultConfiguration).initial {
					selected = initial
				}
			}

		}
		
	}
	
}
