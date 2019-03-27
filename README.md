# SwiftGtk

SwiftGtk is an experimental Gtk+ binding for Swift 5.0 that allow to use Gtk+ in more "Swifty" way. Currently it implements a small subset of Gtk+ and it works on MacOS and Ubuntu Linux.

## Dependencies

You need to have Swift 5.0 or higher installed on your computer (tested with 5.0 on CLion IDE) and depending on your platform you need to install Gtk+3.

### MacOS

You need to have Gtk+3 installed on your machine. Recommended way for installing Gtk+3 is through [homebrew](http://brew.sh/).

```bash
brew install gtk+3
```

### Ubuntu 18:04

You need to have Gtk+3 and Clang installed on your machine. You can easily install them with `apt`.

```bash
sudo apt install gtk-3.0-dev clang
```

## Usage

SwiftGtk supports [Swift Package Manager](https://github.com/apple/swift-package-manager) so you only need to add SwiftGtk to your `Package.swift`.

```swift
import PackageDescription

let package = Package(
    name: "SwiftGtkApplication",
    dependencies: [
        .package(url: "https://github.com/GothStar/SwiftGtk", .branch: "master")
    ]
)
```

After that run `swift build` in the folder where `Package.swift` is located. Once it builds you can execute the application `swift run`.

## Demo

Following code will create a window with a button that when it is pressed presents another window.

```swift
import sGtk

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
