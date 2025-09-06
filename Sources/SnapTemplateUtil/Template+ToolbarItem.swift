//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SwiftUI

extension Template {
    
    @ToolbarContentBuilder
    public static func toolbarItem(_ destination: SnapNavigationDestination, placement: ToolbarItemPlacement = .automatic) -> some ToolbarContent {
        ToolbarItem(placement: placement) {
            NavigationToolbarItemButton(destination: destination)
        }
    }
}

private struct NavigationToolbarItemButton: View {
    
    @Environment(\.navigator) private var navigator
    
    let destination: SnapNavigationDestination
    
    var body: some View {
        Button {
            navigator(.present(destination))
        } label: {
            AnyView(destination.label)
        }
    }
}
