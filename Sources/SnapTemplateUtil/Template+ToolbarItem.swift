//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapStyle
import SwiftUI

extension Template {
    
    @MainActor
    @ToolbarContentBuilder
    public static func toolbarItem(_ destination: SnapNavigationDestination, placement: ToolbarItemPlacement = .automatic) -> some ToolbarContent {
        ToolbarItem(placement: placement) {
            NavigationButton(destination: destination)
                .style(labelContent: [.icon])
                .style(buttonVariant: .plain)
        }
    }
}
