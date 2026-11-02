# TODO

Outstanding work on the package.

## TODO-8: Fix the build

`SnapTemplateDemo` does not build, because the package does not compile against either set of dependencies.

- With the demo's `Package.resolved`: it pins `snap-style` to `dc9f469`, which has no `Style.Attribute`, used by `SnapNavigationDestination+Icon.swift`.
- With every dependency at `main`: `AccentOption.swift` uses `Style.Attribute.Accent`, which does not resolve. `SettingsService` is not `Sendable` where `SettingsPickerRow.swift` and `SettingsToggle.swift` need it.
- Update the sources to the current dependencies and update the demo's `Package.resolved`.
- Once the demo builds, remove `Preview Content` from it, including its `DEVELOPMENT_ASSET_PATHS` value and the project's exception for the folder. Build again to verify.

## TODO-9: Xcode 27 project template

Compare `SnapTemplateDemo` with a new project created from the Xcode 27 template.

- Adopt the differences that apply, such as build settings and project structure, in `SnapTemplateDemo`.
- Update the demo project steps in `snap/docs/suite/package-template.md` if the template changes them.

## TODO-1: Settings screen

Add a header and a contact section to the settings screen.

## TODO-2: Usage statistics

Add generic usage statistics.

## TODO-3: SwiftData with sync

Add SwiftData storage with sync.

## TODO-4: Widgets

Add widgets that display and edit SwiftData content.

## TODO-5: Release notes

Add release notes.

## TODO-6: Multiple windows

Support multiple windows.

## TODO-7: Localization

Localize the strings marked with `// TODO-7:`.
