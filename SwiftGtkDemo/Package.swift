// swift-tools-version:5.0

import PackageDescription

let package = Package(
        name: "SwiftGtkDemo",
        dependencies: [
            .package(path: "../")
           // .package(url: "https://github.com/GothStar/SwiftGtk.git", .branch("master"))
        ],
        targets: [

            .target(name: "SwiftGtkDemo", dependencies: ["sGtk"], path: "Sources/SwiftGtkDemo"),
            .testTarget(name: "SwiftGtkDemoTest", dependencies: ["SwiftGtkDemo"])

        ]
)
