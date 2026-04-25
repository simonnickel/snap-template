// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "snap-template",
	platforms: [
		.iOS(.v18), .macOS(.v15)
	],
    products: [
        .library(
            name: "SnapTemplate",
            targets: ["SnapTemplateApp", "SnapTemplateSettings", "SnapTemplateUtil"]
		),
    ],
	dependencies: [
		.package(url: "https://github.com/simonnickel/snap-core.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-dependencies.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-navigation.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-settings-service.git", branch: "main"),
		.package(url: "https://github.com/simonnickel/snap-style.git", branch: "main"),
	],
    targets: [
		.target(
			name: "SnapTemplateApp",
			dependencies: [
                "SnapTemplateSettings",
                "SnapTemplateUtil",
                .product(name: "SnapCore", package: "snap-core"),
                .product(name: "SnapDependencies", package: "snap-dependencies"),
                .product(name: "SnapNavigation", package: "snap-navigation"),
                .product(name: "SnapSettingsService", package: "snap-settings-service"),
                .product(name: "SnapStyle", package: "snap-style"),
            ]
        ),
        .target(
            name: "SnapTemplateSettings",
            dependencies: [
                "SnapTemplateUtil",
                .product(name: "SnapCore", package: "snap-core"),
                .product(name: "SnapDependencies", package: "snap-dependencies"),
                .product(name: "SnapNavigation", package: "snap-navigation"),
                .product(name: "SnapSettingsService", package: "snap-settings-service"),
                .product(name: "SnapStyle", package: "snap-style"),
            ]
        ),
		.target(
			name: "SnapTemplateUtil",
			dependencies: [
				.product(name: "SnapNavigation", package: "snap-navigation"),
				.product(name: "SnapStyle", package: "snap-style"),
			]
		),
    ],
)
