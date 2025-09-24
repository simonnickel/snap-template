//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation

extension SnapNavigationProvider {
    
    /// A default implementation to use if no customisation is needed.
    public func templateDefaultRootDestinations(for window: SnapNavigation.Window<Destination>) -> [Destination] {
        switch window {
            case .main: tabConfigurationEnabledTabs
            case .window(_, let configuration):
                if configuration.style != .single, configuration.shouldBuildRoute {
                    rootDestinations(for: .main)
                } else {
                    []
                }
            case .settings: []
        }
    }
    
}
