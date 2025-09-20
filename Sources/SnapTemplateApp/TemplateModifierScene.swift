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

public struct TemplateModifierScene<Destination: SnapNavigationDestination> : ViewModifier {

	@Dependency(\.templateState) private var templateState: TemplateState
	
	private let window: SnapNavigation.Window<Destination>
	
	public init(window: SnapNavigation.Window<Destination>) {
		self.window = window
	}
	
	public func body(content: Content) -> some View {
		content
        
            // SnapStyle
            .style(accent: \.primary)
            .styleOverride(
                accents: [
                    \.primary: .base(.definition(.value(templateState.accentPrimary ?? .fallbackPrimary))),
                    \.secondary: .base(.definition(.value(templateState.accentSecondary ?? .fallbackSecondary))),
                ]
            )
            .style(scaleFactor: templateState.interfaceScale?.scale)
            .styleSetup(templateState.style)

            // Settings
            .navigationStyle(templateState.navigationLayout?.style)
            .colorScheme(templateState.displayMode?.colorScheme)
        
            // Others
#if !os(macOS) // macOS settings are available in the application menu.
			.tabViewSidebarBottomBar {
				HStack {
                    NavigationButton(destination: TemplateSettingsDestination.settingsScreen)
				}
			}
#endif
	}
	
}
