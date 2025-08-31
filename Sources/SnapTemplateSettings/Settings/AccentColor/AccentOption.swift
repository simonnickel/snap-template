//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapStyle

public enum AccentOption: Codable, CaseIterable, Sendable {
    
    // TODO: Cleaner definitions
    
    case blueFallbackAlternative
    case blueYellow
    case greenFallbackAlternative
    case greenCyan
    case tealFallbackAlternative
    case tealYellow
    case redFallbackAlternative
    case redYellow
    case orangeFallbackAlternative
    case yellowFallbackAlternative
    case mintFallbackAlternative
    case cyanFallbackAlternative
    case purpleFallbackAlternative
    case indigoFallbackAlternative
    case fallbackFallbackAlternative
    
    public var accentPair: (SnapStyle.AccentKey.Value.WrappedValue, SnapStyle.AccentKey.Value.WrappedValue) {
        switch self {
            case .blueFallbackAlternative: (.blue, .fallbackSecondary)
            case .blueYellow: (.blue, .yellow)
            case .greenFallbackAlternative: (.green, .fallbackSecondary)
            case .greenCyan: (.green, .cyan)
            case .tealFallbackAlternative: (.teal, .fallbackSecondary)
            case .tealYellow: (.teal, .yellow)
            case .redFallbackAlternative: (.red, .fallbackSecondary)
            case .redYellow: (.red, .yellow)
            case .orangeFallbackAlternative: (.orange, .fallbackSecondary)
            case .yellowFallbackAlternative: (.yellow, .fallbackSecondary)
            case .mintFallbackAlternative: (.mint, .fallbackSecondary)
            case .cyanFallbackAlternative: (.cyan, .fallbackSecondary)
            case .purpleFallbackAlternative: (.purple, .fallbackSecondary)
            case .indigoFallbackAlternative: (.indigo, .fallbackSecondary)
            case .fallbackFallbackAlternative: (.fallbackPrimary, .fallbackSecondary)
        }
    }

}
