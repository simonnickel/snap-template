//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateSettings
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
            .theme(apply: templateState.theme) // TODO: Check if updates are propagated.
        
            // SnapStyle
            .style(setup: templateState.style)
        
            // Settings
            .navigationStyle(window == .main ? .tabsAdaptable : nil) // TODO: Style from settings
			.preferredColorScheme(templateState.displayMode?.colorScheme)
        
            // Others
#if !os(macOS) // macOS settings are available in the application menu.
			.tabViewSidebarBottomBar {
				HStack {
					ToolbarButtonSettings()
					Spacer()
				}
			}
#endif
	}
	
}
