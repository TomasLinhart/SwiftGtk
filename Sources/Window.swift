//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

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
            return String.init(validatingUTF8: gtk_window_get_title(UnsafeMutablePointer(widgetPointer)))
        }
        set {
            if let title = newValue {
                gtk_window_set_title(UnsafeMutablePointer(widgetPointer), title)
            } else {
                gtk_window_set_title(UnsafeMutablePointer(widgetPointer), nil)
            }
        }
    }

    public var defaultSize: Size {
        get {
            var width: Int32 = 0
            var height: Int32 = 0
            gtk_window_get_default_size(UnsafeMutablePointer(widgetPointer), &width, &height)

            return Size(width: Int(width), height: Int(height))
        }
        set (size) {
            gtk_window_set_default_size(UnsafeMutablePointer(widgetPointer), Int32(size.width), Int32(size.height))
        }
    }

    public var resizable: Bool {
        get {
            return gtk_window_get_resizable(UnsafeMutablePointer(widgetPointer)).toBool()
        }
        set {
            gtk_window_set_resizable(UnsafeMutablePointer(widgetPointer), newValue.toGBoolean())
        }
    }
}
