<!-- Copy badges from SPI -->
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-template%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/simonnickel/snap-template)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-template%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/simonnickel/snap-template) 

> This package is part of the [SNAP](https://github.com/simonnickel/snap) suite.


# SnapTemplate

Contains shared code and Demo Xcode project to setup and use SNAP in an iOS App. 

[![Documentation][documentation badge]][documentation] 

[documentation]: https://swiftpackageindex.com/simonnickel/snap-template/main/documentation/snaptemplate
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue


## Motivation

> Finishing the last 20% of a project takes 80% of the time.
>
> (Source: Someone on the internet)

The goal of SnapTemplate is to already have the last 20% ready, before you even start the project. The same applies to the first 20% of a project: infrastructure, boilerplate and project setup. 

Even if you don't plan to finish the last 60% of it, it allows to test a quick idea with a full app experience around it.


# SnapTemplateDemo

An Xcode project with a base setup of [SNAP](https://github.com/simonnickel/snap). The app comes with structure, navigation and infrastructure prepared, to quickly setup a new app using the SNAP packages.


## Create new App

1. Create and clone repository.
2. Copy files from snap-app-template and get everything in the correct place.
3. Rename project.
    1. Rename top item in project navigator.
    2. Change bundle identifier.
4. Follow setup steps of [snap-settings-service](https://github.com/simonnickel/snap-settings-service#setup).


## Template

The Template comes with:
 
1. Infrastructure to define dependencies and configuration of SNAP packages ready to go.
2. Boilerplate to define a navigation hierarchy for the app using [snap-navigation](https://github.com/simonnickel/snap-navigation).
3. A base settings screen using [snap-settings-service](https://github.com/simonnickel/snap-settings-service) with some theme configuration options. 

<img src="/screenshot.png" height="400">
<img src="/screenshot-settings.png" height="400">


## Configurations

### Info.plist

Added `ITSAppUsesNonExemptEncryption` key with value `NO`, see: [Complying with Encryption Export Regulations](https://developer.apple.com/documentation/security/complying_with_encryption_export_regulations)

### Build Settings

 - Set `Swift Language Version` to 6
 - Enabled Strict Concurrency checking: `SWIFT_STRICT_CONCURRENCY = complete;`


## // TODO:  

- Settings Screen
    - Settings Header
    - Contact
- Generic Usage Statistics
- SwiftData with sync
- Widgets using SwiftData (display, edit)
- Release Notes
- Multiple windows
- Localisation (search "// Missing Localisation")
