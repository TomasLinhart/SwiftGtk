//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Gtk

let app = Application(applicationId: "com.tomaslinhart.swiftgtk.example")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true

    let buttonBox = ButtonBox(orientation: .vertical)

    let label = Label()
    label.selectable = true
    buttonBox.add(label)

    let button = Button(label: "Press")
    button.label = "Press Me"
    button.clicked = { [unowned label] _ in
        label.text = "Oh, you pressed the button."

        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)

        newWindow.showAll()
    }

    buttonBox.add(button)

    let calendarButton = Button(label: "Calendar")
    calendarButton.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let calendar = Calendar()
        calendar.year = 2000
        calendar.showHeading = true

        newWindow.add(calendar)

        newWindow.showAll()
    }

    buttonBox.add(calendarButton)

    let imageButton = Button(label: "Image")
    imageButton.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)

        let image = Image(filename: "GTK.png")

        newWindow.add(image)

        newWindow.showAll()
    }

    buttonBox.add(imageButton)

    let fullScreenButton = Button(label: "Enter Full Screen")
    fullScreenButton.clicked = { _ in
        window.enterFullScreen()
    }

    let exitFullScreenButton = Button(label: "Exit Full Screen")
    exitFullScreenButton.clicked = { _ in
        window.exitFullScreen()
    }

    buttonBox.add(exitFullScreenButton)
    buttonBox.add(fullScreenButton)
    let textView = TextView()
    textView.backspace = { _ in
        print("backspace")
    }
    textView.copyClipboard = { _ in
        print("copyClipboard")
    }
    textView.cutClipboard = { _ in
        print("cutClipboard")
    }
    textView.pasteClipboard = { _ in
        print("pasteClipboard")
    }
    textView.selectAll = { _, select in
        print(select ? "everything is selected" : "everything is unselected")
    }

    buttonBox.add(textView)

    window.add(buttonBox)
}
