//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapFoundation
import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
import SnapTemplateUtil
import SnapStyle
import SwiftUI

extension View {
    public func templatePrepare<Destination: SnapNavigationDestination>(window: SnapNavigation.Window<Destination>) -> some View {
        modifier(TemplateModifierWindow(window: window))
    }
}

struct TemplateModifierWindow<Destination: SnapNavigationDestination> : ViewModifier {

	@Dependency(\.templateState) private var templateState: TemplateState
	
	private let window: SnapNavigation.Window<Destination>
	
	init(window: SnapNavigation.Window<Destination>) {
		self.window = window
	}
	
	func body(content: Content) -> some View {
		content
        
            // - Style
            .style(accent: \.primary)
            .styleOverride(
                accents: [
                    \.primary: .base(.definition(.value(templateState.accentPrimary ?? .fallbackPrimary))),
                    \.secondary: .base(.definition(.value(templateState.accentSecondary ?? .fallbackSecondary))),
                ]
            )
            .style(scaleFactor: templateState.interfaceScale?.scale)
            .styleSetup(templateState.style)

            // - Settings
            .navigationStyle(templateState.navigationLayout?.style)
            .colorScheme(templateState.displayMode?.colorScheme)
        
            // - Navigation
            // Forward elevation defined by SnapNavigation to SnapStyle.
            .environment(\.navigationElevationKeyPath, \.styleElevation)
        
            // - Others
#if !os(macOS) // macOS settings are available in the application menu.
			.tabViewSidebarBottomBar {
				HStack {
                    // TODO FB: Does not update accent when changed, only on restart.
                    // Happens as long as anywhere inside of the view hierarchy is a conditional branch or AnyView.
                    // Could not reproduce it in a separate project.
                    NavigationButton(destination: TemplateSettingsDestination.settingsScreen)
				}
			}
#endif
	}
	
}
