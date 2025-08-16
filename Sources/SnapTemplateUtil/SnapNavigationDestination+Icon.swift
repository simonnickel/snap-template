//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapStyle

extension SnapNavigationDestination {
    
    public var icon: SnapStyle.IconKey.ValueBuilderKeyPath? {
        definition.icon as? SnapStyle.IconKey.ValueBuilderKeyPath
    }
    
}
