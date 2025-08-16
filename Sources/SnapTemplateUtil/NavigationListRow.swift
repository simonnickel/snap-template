//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapStyle
import SwiftUI

/// Combining `SnapNavigation` with `SnapTheme` to provide a themed `NavigationLink` (it's a Button) to use in a `List`.
public struct NavigationListRow<Destination: SnapNavigationDestination>: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.navigationState) private var navigationState
    @Environment(\.isPresentingDestination) private var isPresentingDestination
    
    private let destination: Destination
    
    @State private var isActive: Bool = false
    
    public init(destination: Destination) {
        self.destination = destination
    }
    
    public var body: some View {
        // TODO: isPresentingDestination does not work well here, because the same list row exists on the next screen. Could be changed to `isPresenting(_ destination:, from:)` and check the combination.
        // TODO: isPresented might  just get a bool instead of a closure.
        StyleListRow(.navigate(destination, isPresented: { _ in isActive }), icon: destination.icon) {
            Text(destination.definition.title)
        }
        .onChange(of: navigationState) { _, _ in
            isActive = isPresentingDestination(destination)
        }
    }
    
}
