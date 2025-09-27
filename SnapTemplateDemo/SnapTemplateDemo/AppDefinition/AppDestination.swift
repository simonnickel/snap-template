//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateSettings
import SnapStyle
import SwiftUI

enum AppDestination: SnapNavigationDestination {
		
    case rectangle(index: Int)
	case rectangleA, rectangleB
	
	case circle
	case circleA
	
	case triangle
	
	case settingsTemplate(_ destination: TemplateSettingsDestination)

	var definition: SnapNavigation.ScreenDefinition {
		switch self {
            case .rectangle(let index): .init(title: "Rectangle \(index)", icon: \Style.Keys.Icon.navGroupRectangle)
			case .rectangleA: .init(title: "Rectangle A", icon: \Style.Keys.Icon.navGroupRectangle)
			case .rectangleB: .init(title: "Rectangle B", icon: \Style.Keys.Icon.navGroupRectangle)
				
			case .circle: .init(title: "Circle", icon: \Style.Keys.Icon.navGroupCircle)
			case .circleA: .init(title: "Circle A", icon: \Style.Keys.Icon.navGroupCircle)
				
			case .triangle: .init(title: "Triangle", icon: \Style.Keys.Icon.navGroupTriangle)
			
			case .settingsTemplate(let destination): destination.definition
		}
	}
	
    
    // MARK: Identifiable
    
    var id: Self { self }
    
	
	// MARK: Definition Overrides

	@MainActor
	var label: any View {
		StyleLabel(definition.title, icon: icon)
	}
	
	@MainActor
	var destination: any View {
		definition.destination?() ?? ExampleScreen(destination: self)
	}
	
}
