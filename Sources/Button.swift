//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

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
        
        addSignal("clicked") { [unowned self] in self.clicked?(self) }
    }
    
    public var label: String? {
        get {
            return String.fromCString(gtk_button_get_label(UnsafeMutablePointer(widgetPointer)))
        }
        set {
            if let title = newValue {
                gtk_button_set_label(UnsafeMutablePointer(widgetPointer), title)
            } else {
                gtk_button_set_label(UnsafeMutablePointer(widgetPointer), nil)
            }
        }
    }
    
    public var clicked: (Button -> Void)?
}