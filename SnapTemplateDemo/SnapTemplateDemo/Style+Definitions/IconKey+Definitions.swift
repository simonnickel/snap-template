//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapStyle

extension Style.Keys.Icon {

    
    // MARK: - Navigation
    
    public var navGroupRectangle: ValueBuilder { .base(.definition(.value("rectangle"))) }
    public var navGroupCircle: ValueBuilder { .base(.definition(.value("circle"))) }
    public var navGroupTriangle: ValueBuilder { .base(.definition(.value("triangle"))) }

}
