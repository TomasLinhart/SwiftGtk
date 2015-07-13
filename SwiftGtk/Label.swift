//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

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
            return String.fromCString(gtk_label_get_text(UnsafeMutablePointer<GtkLabel>(widgetPointer)))
        }
        set {
            if let text = newValue {
                gtk_label_set_text(UnsafeMutablePointer<GtkLabel>(widgetPointer), text)
            } else {
                gtk_label_set_text(UnsafeMutablePointer<GtkLabel>(widgetPointer), nil)
            }
        }
    }
    
    public var selectable: Bool {
        get {
            return gtk_label_get_selectable(UnsafeMutablePointer<GtkLabel>(widgetPointer)) == 1
        }
        set {
            gtk_label_set_selectable(UnsafeMutablePointer<GtkLabel>(widgetPointer), newValue ? 1 : 0)
        }
    }
}
