// swift-tools-version:4.2

import PackageDescription


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
                    path: "Sources/CGtk",
                    pkgConfig: "gtk+-3.0",
                    providers: [.apt(["gtk3.0-dev"]),
                                .brew(["gtk3.0-dev"])]), //not Tested yet
            .target(
                    name: "Gtk",
                    dependencies: ["CGtk"],
                    path: "Sources/sGtk"
            )

        ]

)
