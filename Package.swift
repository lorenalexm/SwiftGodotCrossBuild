// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGodotCrossBuild",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftGodotCrossBuild",
			type: .dynamic,
            targets: ["SwiftGodotCrossBuild"]),
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "main"),
    ],
    targets: [
        .target(
            name: "SwiftGodotCrossBuild",
            dependencies: ["SwiftGodot", .product (name: "SwiftGodotMacros", package: "SwiftGodot")],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])],
            linkerSettings: [.unsafeFlags(
                ["-Xlinker", "-undefined",
                 "-Xlinker", "dynamic_lookup"]
            )]
        )
    ]
)
