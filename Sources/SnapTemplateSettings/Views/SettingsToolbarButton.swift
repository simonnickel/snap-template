//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapDependencies
import SnapNavigation
import SnapStyle

public struct ToolbarButtonSettings: View {
	
    @Environment(\.navigator) private var navigator

	public init() {}
	
	public var body: some View {
		
        // TODO: Toolbar Style / Variant
        StyleButton {
            navigator(.present(TemplateSettingsDestination.settingsScreen))
        } content: {
            StyleLabel("Settings", icon: \.settings)
        }

	}
	
}
