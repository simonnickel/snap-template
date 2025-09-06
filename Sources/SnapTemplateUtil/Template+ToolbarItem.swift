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
            NavigationToolbarButton(destination: destination)
        }
    }
}

private struct NavigationToolbarButton: View {
    
    @Environment(\.navigator) private var navigator
    
    private let destination: SnapNavigationDestination
    
    internal init(destination: SnapNavigationDestination) {
        self.destination = destination
    }
    
    internal var body: some View {
        StyleButton(.plain) {
            navigator(.present(destination))
        } content: {
            // TODO: StyleLabel shows weird spacing, because it does not support icon-only. As soon as there is an icon, SwiftUI enforces an icon-only button style.
            // Would be possible if StyleLabel supports .iconOnly or a similar mechanism.
            // Would make NavigationToolbarButton redundant, could use NavigationButton.
            // AnyView(destination.label)
            Label {
                Text(destination.definition.title)
            } icon: {
                if let icon = destination.icon {
                    StyleIcon(icon)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
