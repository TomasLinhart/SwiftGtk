import PackageDescription

let package = Package(
  name:  "SwiftGtk",
  dependencies: [
    .Package(url:  "https://github.com/TomasLinhart/CGtk-OSX", majorVersion: 1)
  ]
)
