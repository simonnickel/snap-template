//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapDependencies
import SnapNavigation
import SnapSettingsService
import SnapTemplateSettings

struct AppNavigationProvider: SnapNavigationProvider {
	
	typealias Destination = AppDestination
	
	func initial(for window: SnapNavigation.Window<Destination>.Initializable) -> Destination {
		switch window {
            case .main: tabConfigurationInitial ?? .circle
			case .settings: .settingsTemplate(.settingsScreen)
		}
	}
    
    static let rootDestinationOptions: [Destination] = [.triangle, .rectangle(index: 0), .circle]
	
	func rootDestinations(for window: SnapNavigation.Window<Destination>) -> [Destination] {
        // Customize if necessary.
        templateDefaultRootDestinations(for: window)
	}
	
	func parent(of destination: Destination) -> Destination? {
		switch destination {
            case .rectangle(index: let index): index < 1 ? .rectangle(index: 0) : .rectangle(index: index - 1)
            case .triangle, .circle, .settingsTemplate(_): nil
            case .rectangleA, .rectangleB: .rectangle(index: 0)
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


// MARK: - Tab Configuration

extension AppNavigationProvider {
    
    /// The default tab configuration.
    /// Defined here and set as `\.tabConfigurationDefault` in Dependencies to use in SnapTemplateSettings.
    static let tabConfigurationDefault = TabConfiguration(
        tabs: rootDestinationOptions.map { $0.tab },
        required: [AppDestination.triangle.tab],
        disabled: [],
        initial: AppDestination.rectangle(index: 0).tab
    )

}
