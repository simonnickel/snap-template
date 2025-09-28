//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateApp
import SwiftUI

@main
struct SnapTemplateDemoApp: App {
	
    var body: some Scene {

		SnapNavigationApp(provider: AppNavigationProvider()) { window, content in
			content
                .templatePrepare(window: window)
		}

    }
	
}


// MARK: - Preview

#Preview {
	
    SnapNavigationPreview(provider: AppNavigationProvider()) { window, content in
        content
            .templatePrepare(window: window)
    }
	
}
