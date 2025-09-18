//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapStyle
import SwiftUI

#if DEBUG

extension Template {
    
    /// A convenience Container to prepare `#Preview` content
    public struct Preview<Content: View>: View {
        
        let screen: SnapNavigationDestination?
        
        let content: (() -> Content)?
        
        public init(screen: SnapNavigationDestination) where Content == EmptyView {
            self.screen = screen
            self.content = nil
        }
        
        public init(_ content: @escaping () -> Content) {
            self.screen = nil
            self.content = content
        }
        
        public var body: some View {
            NavigationStack {
                if let screen {
                    AnyView(screen.destination)
                        .navigationTitle(screen.definition.title)
                } else {
                    content?()
                }
            }
            .styleSetup()
        }
    }
    
}

#endif


// MARK: - Preview

#Preview("View Builder") {
    struct MyView: View {
        
        // Needs `.styleSetup()` to properly scale with DynamicType.
        @ScaledValue(20) var size
        
        var body: some View {
            Rectangle()
                .frame(width: size, height: size)
        }
    }
    
    return Template.Preview() {
        MyView()
    }
    .dynamicTypeSize(.xxxLarge)

}

#Preview("Destination") {
    enum PreviewDestination: SnapNavigationDestination {
        case example
        
        var definition: SnapNavigation.ScreenDefinition {
            switch self {
                case .example: .init(title: "Example", icon: \Style.Keys.Icon.favorite)
            }
        }
        
        var id: Self { self }
        
        @MainActor
        var label: any View {
            StyleLabel(definition.title, icon: icon)
        }
        
        @MainActor
        var destination: any View {
            Text("Content")
        }
    }
        
    return Template.Preview(screen: PreviewDestination.example)
}
