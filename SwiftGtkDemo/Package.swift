import PackageDescription

let package = Package(
  name:  "SwiftGtkDemo",
  dependencies: [
    .Package(url: "../", majorVersion: 0, minor: 1),
  ]
)
