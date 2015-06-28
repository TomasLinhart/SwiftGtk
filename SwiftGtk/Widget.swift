//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class Widget {
    var gtkPointer: UnsafeMutablePointer<GtkWidget>
    
    public weak var parentWidget: Widget? {
        willSet {
            
        }
        didSet {
            if parentWidget != nil {
                selfCopy = self
            } else {
                selfCopy = nil
            }
        }
    }
    var selfCopy: Widget?
    
    init() {
        gtkPointer = nil
        
        selfCopy = self
    }
    
    func setup() {
        
    }
    
    func willMoveToParent() {
        
    }
    
    func didMoveToParent() {
        
    }
}