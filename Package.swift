// swift-tools-version:5.0

import PackageDescription

#if os(OSX)
let gtkPath = "Sources/CGtk-Mac"
#elseif os(Linux)
let gtkPath = "Sources/CGtk-Linux"
#else
fatalError("Unsupported platform.")
#endif
let package = Package(
    name: "sGtk",
    products: [
        .library(name: "sGtk",
                 targets: ["Gtk"]
        )
        
        
    ], //is necessary here?
    targets: [
        .systemLibrary(
            name: "CGtk",
            path: gtkPath,
            pkgConfig: "gtk+-3.0",
            providers: [.apt(["gtk3.0-dev"]),
                        .brew(["pkg-config", "gtk+3"])]),

        .target(
            name: "Gtk",
            dependencies: ["CGtk"],
            path: "Sources/sGtk"
        ),
    ]
    
)
