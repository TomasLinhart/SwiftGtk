import PackageDescription

let package = Package(
  name:  "SwiftGtkDemo",
  dependencies: [
    .Package(url: "../", majorVersion: 1),
  ]
)
