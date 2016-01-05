//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Widget {
    /// Provides a box that captures a callback for a signal so it makes easier to add signals.
    class SignalBox {
        let callback: () -> Void
        
        init(callback: () -> Void) {
            self.callback = callback
        }
    }
    
    private var signals: [(UInt, SignalBox)] = []
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
    
    deinit {
        removeSignals()
    }
    
    private func removeSignals() {
        for (handlerId, _) in signals {
            disconnectSignal(widgetPointer, handlerId: handlerId)
        }
        
        signals = []
    }

    func didMoveToParent() {
        
    }
    
    func didMoveFromParent() {
        
    }
    
    /// Adds a signal that is not carrying any additional information.
    func addSimpleSignal(name: String, callback: () -> Void) {
        let box = SignalBox(callback: callback)
        let handlerId = connectSignal(widgetPointer, name: name, data: unsafeAddressOf(box)) { _, data in
            let box = unsafeBitCast(data, SignalBox.self)
            box.callback()
        }
        
        signals.append((handlerId, box))
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
            return gtk_widget_get_opacity(widgetPointer)
        }
        set {
            gtk_widget_set_opacity(widgetPointer, newValue)
        }
    }
}