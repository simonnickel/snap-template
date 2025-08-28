//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI

public enum DisplayMode: String, PickableSetting {
	
	// TODO Localisation
	public static var title: String { "Display Mode" }
	
	public var id: String { self.rawValue }
	
	// TODO Localisation
	public var title: String { self.rawValue.uppercasedFirstLetter }
	
	
	// MARK: - Options
	
	case light, system, dark
	
	public var colorScheme: ColorScheme? {
		switch self {
			case .light: .light
			case .dark: .dark
			default: nil
		}
	}
	
}
