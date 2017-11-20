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

    public var wrapMode: GtkWrapMode {
      get {
        return gtk_text_view_get_wrap_mode(castedPointer())
      }
      set {
        gtk_text_view_set_wrap_mode(castedPointer(), newValue)
      }
    }

    public var text: String {
      get {
        var string = ""
        var start = GtkTextIter()
        var end = GtkTextIter()
        let buffer = gtk_text_view_get_buffer(castedPointer())

        gtk_text_buffer_get_start_iter(buffer, &start)
        gtk_text_buffer_get_end_iter(buffer, &end)

        let text = gtk_text_buffer_get_text(buffer, &start, &end, gboolean(0))
        let loop = stride(from: 0, to: gtk_text_iter_get_offset(&end), by: 1)
        for i in loop {
          string += String(UnicodeScalar(UInt8(text![Int(i)])))
        }
        return string
      }
      set {
        gtk_text_buffer_set_text(gtk_text_view_get_buffer(castedPointer()), newValue, gint(newValue.count))
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
