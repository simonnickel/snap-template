//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapStyle
import SnapSettingsService
import SnapDependencies

public struct AccentColorPicker: View {
	
	private enum Constants {
		static let width: CGFloat = 50
	}
	
    // TODO: What was this used for?
	@ScaledMetric private var scaleFactor: CGFloat = 1
	
	@Dependency(\.settingsService) private var settings
	
	private let setting: SettingsService.Value<AccentOption?>
	
	public init(setting: SettingsService.Value<AccentOption?>) {
		self.setting = setting
	}
	
	public var body: some View {

        StyleFlowLayout(spacingH: \.spacingElements, spacingV: \.spacingElements) {
            ForEach(AccentOption.allCases, id: \.self) { option in
                
                // TODO: Identify default if no setting is available.
                let isSelected = option == setting.value
                
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
                            .stroke(Color.primary, lineWidth: 2) // TODO: Width Value from generic line width NumberKey
                    }
                }
                .frame(width: Constants.width, height: Constants.width) // TODO: Scale values
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

