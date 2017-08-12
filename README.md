# SwiftGtk

SwiftGtk is a experimental Gtk+ binding for Swift that tries to make usage of Gtk+ pleasant and "Swifty" as much as possible. Currently it implements only a small subset of Gtk+ and it works on Mac OS X and Linux.

## Dependencies

You need to have Swift 3.1 or higher installed on your computer (tested with 3.1.1 bundled with Xcode 8.3.3) and depending on your platform you need to install Gtk+3. On Mac OS X you can also build the project with Xcode.

### Mac OS X

You need to have Gtk+3 installed on your machine. Recommended way for installing Gtk+3 is through [homebrew](http://brew.sh/).

```bash
brew install gtk+3
```

### Linux

You need to have Gtk+3 and Clang installed on your machine. You can easily install them with `apt-get`.

```bash
sudo apt-get install libgtk-3-dev clang
```

## Usage

SwiftGtk supports [Swift Package Manager](https://github.com/apple/swift-package-manager) so you only need to add SwiftGtk to your `Package.swift`.

```swift
import PackageDescription

let package = Package(
    name: "SwiftGtkApplication",
    dependencies: [
        .Package(url: "https://github.com/TomasLinhart/SwiftGtk", majorVersion: 0, minor: 3)
    ]
)
```

After that run `swift build` in the folder where `Package.swift` is located. Once it builds you can execute the application `.build/debug/SwiftGtkApplication`.

## Demo

Following code will create a window with a button that when it is pressed presents another window.

```swift
import SwiftGtk

let app = Application(applicationId: "com.example.application")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true

    let button = Button(label: "Press Me")
    button.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)

        newWindow.showAll()
    }

    window.add(button)
}
```

![](Screenshots/Linux.png)

## License

All code is licensed under MIT license.
