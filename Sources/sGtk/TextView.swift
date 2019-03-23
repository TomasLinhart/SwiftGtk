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

        addSignal(name: "backspace") { [unowned self] in self.backspace?(self) }
        addSignal(name: "copy-clipboard") { [unowned self] in self.copyClipboard?(self) }
        addSignal(name: "cut-clipboard") { [unowned self] in self.cutClipboard?(self) }
        addSignal(name: "paste-clipboard") { [unowned self] in self.pasteClipboard?(self) }

        addSignal(name: "insert-at-cursor") { [unowned self] (pointer: UnsafeMutableRawPointer) in
            let pointer = UnsafeRawPointer(pointer).bindMemory(to: CChar.self, capacity: 1)
            let string = String(cString: pointer)
            self.insertAtCursor?(self, string)
        }

        addSignal(name: "preedit-changed") { [unowned self] (pointer: UnsafeMutableRawPointer) in
            let pointer = UnsafeRawPointer(pointer).bindMemory(to: CChar.self, capacity: 1)
            let string = String(cString: pointer)
            self.preeditChanged?(self, string)
        }

        addSignal(name: "select-all") { [unowned self] (pointer: UnsafeMutableRawPointer) in
            // We need to get actual value of the pointer because it is not pointer but only integer.
            let select = Int(bitPattern: pointer).toBool()
            self.selectAll?(self, select)
        }
    }

    public var editable: Bool {
        get {
            return gtk_text_view_get_editable(castedPointer()).toBool()
        }
        set {
            gtk_text_view_set_editable(castedPointer(), newValue.toGBoolean())
        }
    }

    // MARK: - Signals

    public var backspace: ((TextView) -> Void)?
    public var pasteClipboard: ((TextView) -> Void)?
    public var cutClipboard: ((TextView) -> Void)?
    public var copyClipboard: ((TextView) -> Void)?
    public var selectAll: ((TextView, Bool) -> Void)?
    public var preeditChanged: ((TextView, String) -> Void)?
    public var insertAtCursor: ((TextView, String) -> Void)?
}
