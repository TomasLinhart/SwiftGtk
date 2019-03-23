// swift-tools-version:4.2

#if os(Linux)
import Glibc
#endif

import PackageDescription


let package = Package(
        name: "cGtk",
        targets: [
            .systemLibrary(
                    name: "CTermios",
                    pkgConfig: "gio-unix-2.0",
                    providers: [.apt(["libglib2.0-dev"]),
                                .brew(["libglib2.0-dev"])]),
            .systemLibrary(
                    name: "CGio",
                    pkgConfig: "gio-unix-2.0",
                    providers: [.apt(["libglib2.0-dev"]),
                                .brew(["libglib2.0-dev"])]), //not Tested yet

        ]

)