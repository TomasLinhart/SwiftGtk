//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Gtk

public class Button: Bin {
    public override init() {
        super.init()
        widgetPointer = gtk_button_new()
    }
    
    public init(label: String) {
        super.init()
        widgetPointer = gtk_button_new_with_label(label)
    }
    
    override func didMoveToParent() {
        super.didMoveToParent()
        
        let handlerId = connectSignal(widgetPointer, name: "clicked", data: unsafeAddressOf(self)) { _, data in
            let button = unsafeBitCast(data, Button.self)
            button.clicked?(button)
        }
        
        signals.append(handlerId)
    }
    
    public var label: String? {
        get {
            return String.fromCString(gtk_button_get_label(UnsafeMutablePointer<GtkButton>(widgetPointer)))
        }
        set {
            if let title = newValue {
                gtk_button_set_label(UnsafeMutablePointer<GtkButton>(widgetPointer), title)
            } else {
                gtk_button_set_label(UnsafeMutablePointer<GtkButton>(widgetPointer), nil)
            }
        }
    }
    
    public var clicked: (Button -> Void)?
}