//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Combine
import SnapDependencies
import SnapNavigation
import SnapSettingsService
import SnapTemplateSettings
import SnapStyle
import SwiftUI

@Observable
public class TemplateState {
	
	@ObservationIgnored
	@Dependency(\.settingsService) private var settings

	/// Overrides the system color scheme (dark / light) for the `AppContainer`, propagates up the view hierarchy using .preferredColorScheme.
	public var displayMode: DisplayMode?
	
	public var interfaceScale: InterfaceScale?
	
    public var navigationLayout: NavigationLayout?
	
    /// Primary accent selected in Settings.
    public var accentPrimary: Style.Keys.Accent.Value.WrappedValue?
    /// Secondary accent selected in Settings.
    public var accentSecondary: Style.Keys.Accent.Value.WrappedValue?
    
    let style: Style = Style(
        configuration: .init(
            allowNavigationBarTitleAdjustments: true
        )
    )
	
	public init() {
		setupDisplayMode()
		setupInterfaceScale()
		setupNavigationLayout()
		setupAccentColor()
	}
	
	
	// MARK: - Settings Updates
	
    // TODO: Settings could use Observable.
	@ObservationIgnored private var subscriptions: [AnyCancellable] = []
	
	
	// MARK: DisplayMode
	
	private func setupDisplayMode() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.displayMode)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.displayMode = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: InterfaceScale
	
	private func setupInterfaceScale() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.interfaceScale)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.interfaceScale = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: NavigationLayout
	
	private func setupNavigationLayout() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.navigationLayout)
			.withWeak(self)
			.sink { weakSelf, value in
                weakSelf.navigationLayout = value
			}
			.store(in: &subscriptions)
	}
	
	
	// MARK: AccentColor
	
	private func setupAccentColor() {
		// Apply change of settings to state. Handle Remote change. Also sets initial value.
		settings.publisher(.accent)
			.withWeak(self)
			.sink { weakSelf, value in
                weakSelf.accentPrimary = value?.accentPair.0
                weakSelf.accentSecondary = value?.accentPair.1
			}
			.store(in: &subscriptions)
	}
	
}
