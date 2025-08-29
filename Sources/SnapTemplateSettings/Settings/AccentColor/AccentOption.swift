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
    
    public var accentPair: SnapStyle.Accent.Pair {
        switch self {
            case .blueFallbackAlternative: .init(.blue, .fallbackAlternative)
            case .blueYellow: .init(.blue, .yellow)
            case .greenFallbackAlternative: .init(.green, .fallbackAlternative)
            case .greenCyan: .init(.green, .cyan)
            case .tealFallbackAlternative: .init(.teal, .fallbackAlternative)
            case .tealYellow: .init(.teal, .yellow)
            case .redFallbackAlternative: .init(.red, .fallbackAlternative)
            case .redYellow: .init(.red, .yellow)
            case .orangeFallbackAlternative: .init(.orange, .fallbackAlternative)
            case .yellowFallbackAlternative: .init(.yellow, .fallbackAlternative)
            case .mintFallbackAlternative: .init(.mint, .fallbackAlternative)
            case .cyanFallbackAlternative: .init(.cyan, .fallbackAlternative)
            case .purpleFallbackAlternative: .init(.purple, .fallbackAlternative)
            case .indigoFallbackAlternative: .init(.indigo, .fallbackAlternative)
            case .fallbackFallbackAlternative: .init(.fallback, .fallbackAlternative)
        }
    }

}
