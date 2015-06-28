//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import SwiftGtk
import Gtk

let app = Application(applicationId: "com.tomaslinhart.swiftgtk.example")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = CGSize(width: 400, height: 400)
    
    let buttonBox = ButtonBox()
    
    let button = Button()
    button.label = "Press Me"
    button.clicked = { _ in
        print("I was pressed")
    }
    
    buttonBox.add(button)
    window.add(buttonBox)
}
