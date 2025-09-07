//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateApp
import SwiftUI

// TODO: Settings button default placement on iPhone
// Should SnapNavigation support root destination toolbar setup?

@main
struct SnapTemplateDemoApp: App {
	
    var body: some Scene {

		SnapNavigationApp(provider: AppNavigationProvider()) { window, content in
			content
                .modifier(TemplateModifierScene(window: window))
		}

    }
	
}


// MARK: - Preview

#Preview {
	
    SnapNavigationPreview(provider: AppNavigationProvider()) { window, content in
        content
            .modifier(TemplateModifierScene(window: window))
    }
	
}
