//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapNavigation
import SnapStyle
import SnapSettingsService

public enum TemplateSettingsDestination: SnapNavigationDestination {
	
	case settingsScreen
    case tabConfiguration

	public var definition: SnapNavigation.ScreenDefinition {
		switch self {
            case .settingsScreen: .init(title: "Settings", icon: \Style.Keys.Icon.settings, style: .modal) { TemplateSettingsScreen() }
			case .tabConfiguration: .init(title: "Configure Tabs", icon: \Style.Keys.Icon.settingsTabs) {
                ConfigureTabsScreen()
			}
		}
	}
    
    
    // MARK: Identifiable
    
    public var id: Self { self }
    
	
	// MARK: Definition Overrides

	@MainActor
	public var label: any View {
		return StyleLabel(definition.title, icon: icon)
	}
	
	@MainActor
	public var destination: any View {
		definition.destination?() ?? EmptyView()
	}
	
}
