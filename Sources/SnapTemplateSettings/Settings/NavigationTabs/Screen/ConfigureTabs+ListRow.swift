//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapCore
import SnapStyle
import SnapSettingsService
import SnapDependencies

extension ConfigureTabsScreen {
	
	struct ListRow: View {
        
        @Dependency(\.templateTabConfigurationIconMapping) private var tabConfigurationIconMapping
		
		let tab: TabConfiguration.Tab
		let tabsSetting: SettingsService.Value<TabConfiguration?>
		let defaultConfiguration: TabConfiguration
		
        // TODO: Merge into struct
		@State private var isOn: Bool = false
		@State private var isRequired: Bool = false
        /// `false` if the tab will not be visible in the tab bar.
		@State private var isVisibleInTabBar: Bool = false
		
		var body: some View {
            
            // TODO: Haptic Feedback on label tap
            let icon = tabConfigurationIconMapping[tab.id]
            let variant: StyleListRowVariant<AnyHashable> = isRequired ? .plain : .enabled($isOn)
            StyleListRow(variant, icon: icon) {
                Text(tab.name)
			}
            // TODO: set disabled style
//            .if(!isVisibleInTabBar) { view in
//				view.theme(color: .foregroundDisabled)
//			}
			.onChange(of: isOn) { oldValue, newValue in
				let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
				var disabled = configuration.disabled
				if newValue {
					disabled.remove(tab)
				} else {
					disabled.insert(tab)
				}
				tabsSetting.set(configuration.updated(disabled: disabled))
			}
			.onChange(of: tabsSetting.value, initial: true) { oldValue, newValue in
				let configuration = tabsSetting.value?.updated(withDefaults: defaultConfiguration) ?? defaultConfiguration
				isOn = !configuration.disabled.contains(tab)
				isRequired = configuration.required.contains(tab)
				isVisibleInTabBar = configuration.isVisible(tab)
			}
			
		}
	}
	
}
