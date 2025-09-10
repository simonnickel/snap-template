//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapStyle

extension SnapNavigationDestination {
    
    /// A typed KeyPath to access the icon. `SnapNavigation.ScreenDefinition` can not provide the icon as ValueBuilderKeyPath.
    public var icon: Style.IconKey.ValueBuilderKeyPath? {
        definition.icon as? Style.IconKey.ValueBuilderKeyPath
    }
    
}
