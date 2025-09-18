//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation
import SnapNavigation

public struct NavigationLayout: PickableSetting {
    
    public let style: SnapNavigation.NavigationStyle
	
    // Missing Localisation
	public static var title: String { "Navigation Layout" }
    
    public static var allCases: [NavigationLayout] {
        SnapNavigation.NavigationStyle.allCases
            .filter { $0 != .automatic }
            .map { NavigationLayout(style: $0) }
    }
        
    public var id: SnapNavigation.NavigationStyle { style.self }
    
    // Missing Localisation
    public var title: String {
        switch style {
            case .automatic: "Automatic"
            case .single: "Single"
            case .tabsAdaptable: "Tabs Adaptable"
        }
    }
	
    public static var defaultValue: NavigationLayout { .init(style: .tabsAdaptable) }
    public static var single: NavigationLayout { .init(style: .single) }
    public static var tabsAdaptable: NavigationLayout { .init(style: .tabsAdaptable) }
    
}
