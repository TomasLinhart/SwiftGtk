//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
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
    
    public var defaultSize: CGSize? {
        get {
            // TODO: Add proper size getter.
            return CGSize()
        }
        set {
            if let size = newValue {
                gtk_window_set_default_size(UnsafeMutablePointer<GtkWindow>(widgetPointer), Int32(size.width), Int32(size.height))
            } else {
                gtk_window_set_default_size(UnsafeMutablePointer<GtkWindow>(widgetPointer), 0, 0)
            }
        }
    }
}
