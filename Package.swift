// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextReplacementView",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "TextReplacementView",
            targets: ["TextReplacementView"]
        )
    ],
    targets: [
        .target(
            name: "TextReplacementView"
        ),
        .testTarget(
            name: "TextReplacementViewTests",
            dependencies: ["TextReplacementView"]
        )
    ]
)
