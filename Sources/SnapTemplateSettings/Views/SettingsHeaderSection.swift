//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapStyle

// TODO: Image

public struct SettingsHeaderSection: View {

	public init(name: String, text: String) {
		self.name = name
		self.text = text
	}

	private let name: String
	private let text: String
	
	public var body: some View {
		Section {
            EmptyView()
        } header: {
            StyleStack(spacing: \.spacingGroups, alignmentH: .leading) {
                StyleStack(.horizontal, spacing: \.spacingGroups) {
                    Circle()
                        .frame(width: 80)
                    StyleStack(alignmentH: .leading) {
                        Text("Hey 👋,")
                        Text(name)
                    }
                    .style(element: .title)
                }
                Text(text)
                    .style(font: \.content)
// TODO:                    .theme(text: .textBlock)
            }
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
