//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation

public enum InterfaceScale: String, PickableSetting {
	
	// TODO Localisation
	public static var title: String { "Interface Scale" }
	
	public var id: String { self.rawValue }
	
	// TODO Localisation
	public var title: String { self.rawValue.uppercasedFirstLetter }
	
	
	// MARK: - Options
	
	case tiny, small, medium, large, huge
	
	public var scale: Double {
		switch self {
            // TODO: Could reference a Style Number Key to control the value.
            case .tiny: 0.75
            case .small: 0.9
            case .medium: 1
            case .large: 1.1
            case .huge: 1.25
		}
	}
	
}
