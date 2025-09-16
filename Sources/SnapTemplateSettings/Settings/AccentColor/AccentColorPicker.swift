//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapStyle
import SnapSettingsService
import SnapDependencies

public struct AccentColorPicker: View {
	
	@Dependency(\.settingsService) private var settings
    
    @Environment(\.style) private var style
    
    @ScaledValue(50) private var sizeItem
    @ScaledNumber(\.strokeSelected) private var widthSelectedStroke
    @ScaledNumber(\.spacingElements) private var spacing
	
	private let setting: SettingsService.Value<AccentOption?>
	
	public init(setting: SettingsService.Value<AccentOption?>) {
		self.setting = setting
	}
	
	public var body: some View {

        StyleFlowLayout(spacingH: spacing, spacingV: spacing) {
            ForEach(AccentOption.allCases, id: \.self) { option in
                
                var isSelected = if let value = setting.value {
                    option == value
                } else {
                    option == .fallbackFallbackAlternative
                }
                
                ZStack {
                    StyleShapeView(shape: .circle, surface: \.accentGradientStrong)
                        .styleOverride(
                            accents: [
                                \.primary: .base(.definition(.value(option.accentPair.0))),
                                \.secondary: .base(.definition(.value(option.accentPair.1))),
                            ]
                        )
                    
                    if isSelected {
                        Circle()
                            .fill(.clear)
                            .stroke(Color.primary, lineWidth: widthSelectedStroke)
                    }
                }
                .frame(width: sizeItem)
                .onTapGesture {
                    setting.set(option)
                }
                
            }
        }

	}
	
}


// MARK: - Preview

#Preview {
	
	let settings = SettingsService()
	
	return AccentColorPicker(setting: settings.value(.accent))
	
}

