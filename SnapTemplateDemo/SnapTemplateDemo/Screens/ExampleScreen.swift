//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapTemplateUtil
import SnapStyle
import SwiftUI

struct ExampleScreen: View {
	
	@Dependency(\.dataSource) private var dataSource
    @Environment(\.navigator) private var navigator
	
	let destination: AppDestination
	
	var body: some View {
		
        StyleList {

            Section {
                
                StyleListRow(.plain) {
                    Text(dataSource.content)
                }
                
                NavigationListRow(destination: AppDestination.rectangle)
                
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
                }
                .style(padding: \.spacingGroups, [.vertical, .trailing])
                .stretch(alignment: .center)
                
            }

		}
        .toolbar {
            Template.toolbarItem(AppDestination.settingsTemplate(.settingsScreen), placement: .topBarLeading)
        }
		
	}
	
}


// MARK: - Preview

#Preview {
	
    ExampleScreen(destination: .circle)
	
}
