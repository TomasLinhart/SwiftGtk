//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class Window: Bin {
    public override init() {
        super.init()
        
        setup()
    }
    
    override func setup() {
        gtkPointer = UnsafeMutablePointer<GtkWidget>(gtk_window_new(GTK_WINDOW_TOPLEVEL))
    }
    
    public var title: String? {
        get {
            return String.fromCString(gtk_window_get_title(UnsafeMutablePointer<GtkWindow>(gtkPointer)))
        }
        set {
            if let title = newValue {
                gtk_window_set_title(UnsafeMutablePointer<GtkWindow>(gtkPointer), title)
            } else {
                gtk_window_set_title(UnsafeMutablePointer<GtkWindow>(gtkPointer), nil)
            }
        }
    }
    
    public var defaultSize: CGSize? {
        get {
            return CGSize()
        }
        set {
            if let size = newValue {
                gtk_window_set_default_size(UnsafeMutablePointer<GtkWindow>(gtkPointer), Int32(size.width), Int32(size.height))
            } else {
                gtk_window_set_default_size(UnsafeMutablePointer<GtkWindow>(gtkPointer), 0, 0)
            }
        }
    }
}
