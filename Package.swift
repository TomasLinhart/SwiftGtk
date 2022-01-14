// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGtk",
    dependencies: [],
    targets: [
        .systemLibrary(
            name: "CGtk",
            pkgConfig: "gtk+-3.0",
            providers: [
                .brew(["gtk+3"]),
                .apt(["libgtk-3-dev"]),
            ]
        ),
        .target(
            name: "SwiftGtk",
            dependencies: [
              "CGtk",
            ])
    ]
)
