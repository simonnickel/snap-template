//
//  SettingsHeaderSection.swift
//  SnapTemplateShared
//
//  Created by Simon Nickel on 29.09.23.
//

import SwiftUI
import SnapTheme

// TODO: Image

public struct SettingsHeaderSection: View {
	
	@Environment(\.theme) private var theme

	public init(name: String, text: String) {
		self.name = name
		self.text = text
	}

	private let name: String
	private let text: String
	
	public var body: some View {
		Section {
			ThemeVStack(alignment: .leading, spacing: .spacingGroups) {
				ThemeHStack(spacing: .spacingGroups) {
					Circle()
						.frame(width: 80)
					ThemeVStack(alignment: .leading) {
						Text("Hey 👋,")
						Text(name)
					}
					.theme(text: .sceneHeaderSubtitle)
				}
				Text(text)
					.theme(text: .textBlock)
			}
			.listRowInsets(.zero)
#if !os(macOS)
			.theme(listRowBackground: .scene)
#endif
		}
	}
	
}


// MARK: - Preview

#Preview {
	
	List {
		
		SettingsHeaderSection(name: "I am Someone", text: "Some Text")
		
		Section {
			Text("List")
		}
		
	}
	
}
