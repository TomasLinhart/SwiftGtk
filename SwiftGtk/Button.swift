//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class Button: Bin {
    public override init() {
        super.init()
        
        setup()
    }
    
    override func setup() {
        gtkPointer = UnsafeMutablePointer<GtkWidget>(gtk_button_new())
        
        connectSignal(gtkPointer, name: "clicked", data: &selfCopy) { _, data in
            let button = UnsafeMutablePointer<Button>(data).memory
            button.clicked?(button)
        }
    }
    
    public var label: String? {
        get {
            return String.fromCString(gtk_button_get_label(UnsafeMutablePointer<GtkButton>(gtkPointer)))
        }
        set {
            if let title = newValue {
                gtk_button_set_label(UnsafeMutablePointer<GtkButton>(gtkPointer), title)
            } else {
                gtk_button_set_label(UnsafeMutablePointer<GtkButton>(gtkPointer), nil)
            }
        }
    }
    
    public var clicked: (Button -> Void)?
}