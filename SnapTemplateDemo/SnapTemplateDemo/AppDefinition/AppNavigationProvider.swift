//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplateSettings

struct AppNavigationProvider: SnapNavigationProvider {
	
	typealias Destination = AppDestination
	
	func initial(for scene: SnapNavigation.Window<Destination>.Initializable) -> Destination {
		switch scene {
			case .main: .triangle
			case .settings: .settingsTemplate(.settingsScreen)
		}
	}
	
	func selectableDestinations(for scene: SnapNavigation.Window<Destination>) -> [Destination] {
		switch scene {
			case .main: [.triangle, .rectangle, .circle]
			case .window(_, let configuration):
                if configuration.style != .single, configuration.shouldBuildRoute {
					selectableDestinations(for: .main)
				} else {
					[]
				}
			case .settings: []
		}
	}
	
	func parent(of destination: Destination) -> Destination? {
		switch destination {
			case .triangle, .rectangle, .circle, .settingsTemplate(_): nil
			case .rectangleA, .rectangleB: .rectangle
			case .circleA: .circle
		}
	}
	
	func translate(_ destination: any SnapNavigationDestination) -> AppDestination? {
		switch destination {
			case let destination as AppDestination: destination
			
			case let destination as TemplateSettingsDestination: .settingsTemplate(destination)
			
			default: nil
		}
	}
}
