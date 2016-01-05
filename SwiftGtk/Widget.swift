//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Widget {
    var signals: [UInt] = []
    var widgetPointer: UnsafeMutablePointer<GtkWidget>
    
    public weak var parentWidget: Widget? {
        willSet {
            
        }
        didSet {
            if parentWidget != nil {
                didMoveToParent()
            } else {
                didMoveFromParent()
                removeSignals()
            }
        }
    }
    
    init() {
        widgetPointer = nil
    }
    
    private func removeSignals() {
        for handlerId in signals {
            disconnectSignal(widgetPointer, handlerId: handlerId)
        }
    }

    func didMoveToParent() {
        
    }
    
    func didMoveFromParent() {
        
    }
    
    public func showAll() {
        gtk_widget_show_all(widgetPointer)
    }
    
    public func showNow() {
        gtk_widget_show_now(widgetPointer)
    }
    
    public func show() {
        gtk_widget_show(widgetPointer)
    }
    
    public func hide() {
        gtk_widget_hide(widgetPointer)
    }
    
    public var opacity: Double {
        get {
            return gtk_widget_get_opacity(UnsafeMutablePointer<GtkWidget>(widgetPointer))
        }
        set {
            gtk_widget_set_opacity(UnsafeMutablePointer<GtkWidget>(widgetPointer), newValue)
        }
    }
}