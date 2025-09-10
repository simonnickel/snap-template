//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapStyle
import SnapNavigation
import SwiftUI

public struct NavigationButton: View {
    
    @Environment(\.navigator) private var navigator
    
    private let destination: SnapNavigationDestination
    
    public init(destination: SnapNavigationDestination) {
        self.destination = destination
    }
    
    public var body: some View {
        StyleButton {
            navigator(.present(destination))
        } content: {
            AnyView(destination.label)
        }
    }
}


// MARK: - Preview

#Preview {
    enum Destination: SnapNavigationDestination {
        
        case screen
        
        var definition: SnapNavigation.ScreenDefinition { .init(title: "Rectangle", icon: \Style.Keys.Icon.favorite) }
        
        var label: any View { StyleLabel(definition.title, icon: icon) }
        
        var destination: any View { EmptyView() }
        
        var id: Self { self }
    }
    
    return NavigationButton(destination: Destination.screen)
}
