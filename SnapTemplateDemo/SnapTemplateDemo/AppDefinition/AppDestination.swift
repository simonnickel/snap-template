//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateSettings
import SnapStyle
import SwiftUI

enum AppDestination: SnapNavigationDestination {
		
	case rectangle
	case rectangleA, rectangleB
	
	case circle
	case circleA
	
	case triangle
	
	case settingsTemplate(_ destination: TemplateSettingsDestination)

	var definition: SnapNavigation.ScreenDefinition {
		switch self {
            case .rectangle: .init(title: "Rectangle", icon: \Style.IconKey.navGroupRectangle)
			case .rectangleA: .init(title: "Rectangle A", icon: \Style.IconKey.navGroupRectangle)
			case .rectangleB: .init(title: "Rectangle B", icon: \Style.IconKey.navGroupRectangle)
				
			case .circle: .init(title: "Circle", icon: \Style.IconKey.navGroupCircle)
			case .circleA: .init(title: "Circle A", icon: \Style.IconKey.navGroupCircle)
				
			case .triangle: .init(title: "Triangle", icon: \Style.IconKey.navGroupTriangle)
			
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
