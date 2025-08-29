//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation

extension SnapNavigationProvider {
    
    private var tabConfiguration: TabConfiguration {
        @Dependency(\.settingsService) var settingsService
        @Dependency(\.tabConfigurationDefault) var tabConfigurationDefault
        
        return settingsService.get(.navigationTabs) ?? tabConfigurationDefault
    }
    
    public var tabConfigurationInitial: Destination? {
        guard let tab = tabConfiguration.initial else { return nil }
        return destination(for: tab)
    }
    
    public var tabConfigurationEnabledTabs: [Destination] {
        tabConfiguration.tabs.compactMap { tab in
            tabConfiguration.disabled.contains(tab) ? nil : destination(for: tab)
        }
    }
    
    private func destination(for tab: TabConfiguration.Tab) -> Destination? {
        Self.rootDestinationOptions.first { destination in
            "\(destination.id)" == tab.id
        }
    }
    
}

extension SnapNavigationDestination {
    
    public var tab: TabConfiguration.Tab {
        .init(id: "\(id)", name: definition.title, icon: icon)
    }

}
