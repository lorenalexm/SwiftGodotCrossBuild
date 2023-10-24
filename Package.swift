// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodotCrossBuild",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftGodotCrossBuild",
			type: .dynamic,
            targets: ["SwiftGodotCrossBuild"]),
    ],
    dependencies: [
        .package(url: "https://github.com/lorenalexm/SwiftGodot", branch: "windows-macros"),
    ],
    targets: [
        .target(
            name: "SwiftGodotCrossBuild",
            dependencies: ["SwiftGodot"],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        )
    ]
)
