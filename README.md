# SwiftGtk

SwiftGtk is a experimental Gtk+ binding for Swift that tries to make usage of Gtk+ pleasant and "Swifty" as much as possible. Currently it implements only a small subset of Gtk+ and it works only on Mac OS X and Linux.

## Dependencies

You need to have Gtk+3 installed on your machine, all paths are already configured in Xcode projects. Recommended way for installing Gtk+3 is through [homebrew](http://brew.sh/).

```bash
brew install gtk+3
```

It works with Swift 2.2 and higher (tested with build from 25.01.2016).

## Installation

SwiftGtk supports [Swift Package Manager](https://github.com/apple/swift-package-manager) so you only need to add SwiftGtk to your `Package.swift`.

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/TomasLinhart/SwiftGtk", majorVersion: 0, minor: 1)
    ]
)
```

Whenever you build you need to include headers for CGtk.

```bash
swift build -Xcc -I/usr/local/include/cairo -Xcc -I/usr/local/include/gtk-3.0 -Xcc -I/usr/local/include/glib-2.0/ -Xcc -I/usr/local/include/pango-1.0 -Xcc -I/usr/local/include/gdk-pixbuf-2.0 -Xcc -I/usr/local/include/atk-1.0 -Xcc -I/usr/local/lib/glib-2.0/include
```

## Demo

Following code will create a window with a button that when it is pressed presents another window.

```swift
let app = Application(applicationId: "com.example.application")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true

    let button = Button(label: "Press Me")
    button.clicked = { _ in
        let newWindow = Window(windowType: .TopLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)

        newWindow.showAll()
    }

    window.add(button)
}
```

## License

All code is licensed under MIT license.
