//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Gtk

public class Window: Bin {
    public enum WindowType {
        case TopLevel
        case PopUp
        
        private func toGtkWindowType() -> GtkWindowType {
            switch self {
            case .TopLevel:
                return GTK_WINDOW_TOPLEVEL
            case .PopUp:
                return GTK_WINDOW_POPUP
            }
        }
    }
    
    public init(windowType: WindowType = .TopLevel) {
        super.init()   
        widgetPointer = gtk_window_new(windowType.toGtkWindowType())
    }
    
    public var title: String? {
        get {
            return String.fromCString(gtk_window_get_title(UnsafeMutablePointer<GtkWindow>(widgetPointer)))
        }
        set {
            if let title = newValue {
                gtk_window_set_title(UnsafeMutablePointer<GtkWindow>(widgetPointer), title)
            } else {
                gtk_window_set_title(UnsafeMutablePointer<GtkWindow>(widgetPointer), nil)
            }
        }
    }
    
    public var defaultSize: Size {
        get {
            var width: Int32 = 0
            var height: Int32 = 0
            gtk_window_get_default_size(UnsafeMutablePointer<GtkWindow>(widgetPointer), &width, &height)

            return Size(width: Int(width), height: Int(height))
        }
        set (size) {
            gtk_window_set_default_size(UnsafeMutablePointer<GtkWindow>(widgetPointer), Int32(size.width), Int32(size.height))
        }
    }
    
    public var resizable: Bool {
        get {
            return gtk_window_get_resizable(UnsafeMutablePointer<GtkWindow>(widgetPointer)) == 1 ? true : false
        }
        set {
            gtk_window_set_resizable(UnsafeMutablePointer<GtkWindow>(widgetPointer), Int32(newValue ? 1 : 0))
        }
    }
}
