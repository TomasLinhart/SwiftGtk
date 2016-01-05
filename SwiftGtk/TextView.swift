//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

import Gtk

public class TextView: Container {
    public override init() {
        super.init()
        
        widgetPointer = gtk_text_view_new()
    }
    
    public var editable: Bool {
        get {
            return gtk_text_view_get_editable(UnsafeMutablePointer(widgetPointer)).toBool()
        }
        set {
            gtk_text_view_set_editable(UnsafeMutablePointer(widgetPointer), newValue.toGBoolean())
        }
    }
}