//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import SwiftGtk

let app = Application(applicationId: "com.tomaslinhart.swiftgtk.example")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    
    let buttonBox = ButtonBox(orientation: .Vertical)

    let label = Label()
    label.selectable = true
    buttonBox.add(label)
    
    let button = Button(label: "Press")
    button.label = "Press Me"
    button.clicked = { _ in
        label.text = "Oh, you pressed the button."
        
        let newWindow = Window(windowType: .TopLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)
        
        newWindow.showAll()   
    }
    
    buttonBox.add(button)
    window.add(buttonBox)
}
