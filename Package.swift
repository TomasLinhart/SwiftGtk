import PackageDescription

let package = Package(
  name:  "SwiftGtk",
  dependencies: [
    .Package(url:  "./CGtk", majorVersion: 1)
  ]
)
