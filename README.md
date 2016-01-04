# SwiftGtk

SwiftGtk is a experimental Gtk+ binding for Swift that tries to make usage of Gtk+ pleasant and "Swifty" as much as possible. Currently it implements only a small subset of Gtk+ and it works only on Mac OS X due [limitations](https://bugs.swift.org/browse/SR-145) in [spm](https://github.com/apple/swift-package-manager).

## Dependencies

You need to have Gtk+3 installed on your machine, all paths are already configured in Xcode projects. Recommended way for installing Gtk+3 is through [homebrew](http://brew.sh/).

```bash
brew install gtk+3
```

It works with Swift version 2.1.1 and with Swift 2.2 (build from 31.12.2015).

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
