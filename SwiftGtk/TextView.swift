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
        
        addSimpleSignal("backspace") { [unowned self] in self.backspace?(self) }
        addSimpleSignal("copy-clipboard") { [unowned self] in self.copyClipboard?(self) }
        addSimpleSignal("cut-clipboard") { [unowned self] in self.cutClipboard?(self) }
        addSimpleSignal("paste-clipboard") { [unowned self] in self.pasteClipboard?(self) }
    }
    
    public var editable: Bool {
        get {
            return gtk_text_view_get_editable(UnsafeMutablePointer(widgetPointer)).toBool()
        }
        set {
            gtk_text_view_set_editable(UnsafeMutablePointer(widgetPointer), newValue.toGBoolean())
        }
    }
    
    public var backspace: (TextView -> Void)?
    public var pasteClipboard: (TextView -> Void)?
    public var cutClipboard: (TextView -> Void)?
    public var copyClipboard: (TextView -> Void)?
}