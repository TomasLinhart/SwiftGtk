//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Label: Widget {
    public init(text: String? = nil) {
        super.init()
        if let text = text {
            widgetPointer = gtk_label_new(text)
        } else {
            widgetPointer = gtk_label_new(nil)
        }
    }
    
    public var text: String? {
        get {
            return String.fromCString(gtk_label_get_text(UnsafeMutablePointer(widgetPointer)))
        }
        set {
            if let text = newValue {
                gtk_label_set_text(UnsafeMutablePointer(widgetPointer), text)
            } else {
                gtk_label_set_text(UnsafeMutablePointer(widgetPointer), nil)
            }
        }
    }
    
    public var selectable: Bool {
        get {
            return gtk_label_get_selectable(UnsafeMutablePointer(widgetPointer)) == 1
        }
        set {
            gtk_label_set_selectable(UnsafeMutablePointer(widgetPointer), newValue ? 1 : 0)
        }
    }
}
