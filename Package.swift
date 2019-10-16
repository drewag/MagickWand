// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MagickWand",
    platforms: [
        .macOS(.v10_11),
    ],
    products: [
        .library(name: "MagickWand", targets: ["MagickWand"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "MagickWand", dependencies: ["CMagickWand"]),
        .target(name: "CMagickWand", dependencies: [])
    ]
)
