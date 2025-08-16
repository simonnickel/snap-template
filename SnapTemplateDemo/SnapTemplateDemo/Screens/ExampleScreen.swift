//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateUtil
import SnapStyle
import SwiftUI

// TODO: See ToolbarButtonSettings below
import SnapTemplateSettings

struct ExampleScreen: View {
	
	@Dependency(\.dataSource) private var dataSource
    @Environment(\.navigator) private var navigator
    @Environment(\.isPresentingDestination) private var isPresentingDestination
	
	let destination: AppDestination
	
	var body: some View {
		
        StyleList {

            Section {
                
                StyleListRow(.plain) {
                    Text(dataSource.content)
                }
                
                // TODO: isPresentingDestination does not work well here, because the same list row exists on the next screen. Could be changed to `isPresenting(_ destination:, from:)` and check the combination.
                // TODO: , systemImage: AppDestination.rectangle.definition.icon
                // TODO: isPresented might  just get a bool instead of a closure.
                StyleListRow(.navigate(AppDestination.rectangle, isPresented: { value in isPresentingDestination(value) })) {
                    Text(AppDestination.rectangle.definition.title)
                }
                
            } header: {
                
                Text(destination.definition.title + " Screen")
                    .styleListSectionHeaderLabel()
                
            } footer: {
                
                StyleStack(spacing: \.spacingElements, alignmentH: .center, isStretching: false) {
                    StyleButton {
                        navigator(.present(AppDestination.circle))
                    } content: {
                        Text("Push .circle")
                    }
                    
                    // TODO: Should be part of the template and in the navigationbar.
                    ToolbarButtonSettings()
                }
                .style(padding: \.spacingGroups, [.vertical, .trailing])
                .stretch(alignment: .center)
                
            }

		}
		
	}
	
}


// MARK: - Preview

#Preview {
	
    ExampleScreen(destination: .circle)
	
}
