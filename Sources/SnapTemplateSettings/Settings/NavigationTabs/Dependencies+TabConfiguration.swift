//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies

extension Dependencies {
    
    /// Defined in package, but has to be set in project.
    public var tabConfigurationDefault: TabConfiguration { Dependencies.forwarding(for: \.tabConfigurationDefault) }
    
}
