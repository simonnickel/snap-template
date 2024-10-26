//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Combine
import SwiftUI
import SnapTheme
import SnapDependencies
import SnapSettingsService

@Observable
public class TemplateState {
	
	@ObservationIgnored
	@Dependency private var settings: SettingsService

	/// Overrides the system color scheme (dark / light) for the `AppContainer`, propagates up the view hierarchy using .preferredColorScheme.
	public var displayMode: DisplayMode?
	
	public var interfaceScale: InterfaceScale?
	
	// TODO: Adapt navigation layout options in SnapNavigation.
	public var navigationLayout: NavigationLayout?
	
	/// Accent selected in Settings.
	public var accentColor: Theme.ColorSet?
	
	/// The `Theme` applied to the AppContainer.
	public var theme: Theme
	
	public init(theme: Theme = .base) {
		self.theme = theme
		setupDisplayMode()
		setupInterfaceScale()
		setupNavigationLayout()
		setupAccentColor()
	}
	
	
	// MARK: - Settings Updates
	
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
				weakSelf.applyInterfaceScale()
			}
			.store(in: &subscriptions)
	}
	
	private func applyInterfaceScale() {
		var theme = self.theme
		
		if let interfaceScale = interfaceScale {
			theme = theme.replacingValues(
				scale: theme.number(interfaceScale.scale)
			)
		}
		
		self.theme = theme
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
		settings.publisher(.accentColor)
			.withWeak(self)
			.sink { weakSelf, value in
				weakSelf.accentColor = value
				weakSelf.applyAccentColor()
			}
			.store(in: &subscriptions)
	}
	
	private func applyAccentColor() {
		var theme = self.theme
		
		if let accentColorSelected = accentColor {
			theme = theme.replacingValues(
				colors: [
					.accentColors : .colorSet(accentColorSelected.base, complimentary: accentColorSelected.complimentary, complementary: accentColorSelected.complementary)
				]
			)
		} else if let color = theme.systemColor(for: .accentColorBase)?.value {
			theme = theme.replaceAccent(base: color)
		}
		
		self.theme = theme
	}
	
}
