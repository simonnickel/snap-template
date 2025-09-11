//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation
import SnapNavigation

public struct NavigationLayout: PickableSetting {
    
    public let style: SnapNavigation.NavigationStyle
	
	// TODO Localisation
	public static var title: String { "Navigation Layout" }
    
    // TODO: SnapNavigation.NavigationStyle should be CaseIterable.
    public static var allCases: [NavigationLayout] {
        [.init(style: .single), .init(style: .tabsAdaptable)]
    }
        
    public var id: SnapNavigation.NavigationStyle { style.self }
    
    // TODO Localisation
    public var title: String {
        switch style {
            case .single: "Single"
            case .tabsAdaptable: "Tabs Adaptable"
        }
    }
	
    public static var defaultValue: NavigationLayout { .init(style: .tabsAdaptable) }
    public static var single: NavigationLayout { .init(style: .single) }
    public static var tabsAdaptable: NavigationLayout { .init(style: .tabsAdaptable) }
    
}
