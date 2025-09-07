//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies

extension Dependencies {
    
    /// Defined in package, but has to be set in project.
    public var tabConfigurationDefault: TabConfiguration { Dependencies.forwarding(for: \.tabConfigurationDefault) }
    
    /// Provides a mapping to access Icons from Tabs for the tab configuration.
    /// `IconValueKeyPath` can not be a param of `TabConfiguration.Tab`, because it can not be `Codable`.
    /// Defined in package, but has to be set in project, because it depends on the implementation of `SnapNavigationProvider`.
    public var templateTabConfigurationIconMapping: TabConfiguration.IconMapping { Dependencies.forwarding(for: \.templateTabConfigurationIconMapping) }
    
}
