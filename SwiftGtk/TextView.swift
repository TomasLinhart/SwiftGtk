//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

import CGtk

public class TextView: Container {
    public override init() {
        super.init()
        
        widgetPointer = gtk_text_view_new()
    }
    
    override func didMoveToParent() {
        super.didMoveToParent()
        
        addSignal("backspace") { [unowned self] in self.backspace?(self) }
        addSignal("copy-clipboard") { [unowned self] in self.copyClipboard?(self) }
        addSignal("cut-clipboard") { [unowned self] in self.cutClipboard?(self) }
        addSignal("paste-clipboard") { [unowned self] in self.pasteClipboard?(self) }
        
        addSignal("insert-at-cursor") { [unowned self] (pointer: UnsafeMutablePointer<Void>) in
            let string = String.fromCString(UnsafeMutablePointer(pointer))!
            self.insertAtCursor?(self, string)
        }
        
        addSignal("preedit-changed") { [unowned self] (pointer: UnsafeMutablePointer<Void>) in
            let string = String.fromCString(UnsafeMutablePointer(pointer))!
            self.preeditChanged?(self, string)
        }
        
        addSignal("select-all") { [unowned self] (pointer: UnsafeMutablePointer<Void>) in
            // We need to get actual value of the pointer because it is not pointer but only integer.
            let select = unsafeBitCast(pointer, Int.self).toBool()
            self.selectAll?(self, select)
        }
    }
    
    public var editable: Bool {
        get {
            return gtk_text_view_get_editable(UnsafeMutablePointer(widgetPointer)).toBool()
        }
        set {
            gtk_text_view_set_editable(UnsafeMutablePointer(widgetPointer), newValue.toGBoolean())
        }
    }
    
    // MARK: - Signals
    
    public var backspace: (TextView -> Void)?
    public var pasteClipboard: (TextView -> Void)?
    public var cutClipboard: (TextView -> Void)?
    public var copyClipboard: (TextView -> Void)?
    public var selectAll: ((TextView, Bool) -> Void)?
    public var preeditChanged: ((TextView, String) -> Void)?
    public var insertAtCursor: ((TextView, String) -> Void)?
}