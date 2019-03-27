//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public class ToggleButton: Button {
    public override init() {
        super.init()

        widgetPointer = gtk_toggle_button_new()
    }

    public override init(label: String) {
        super.init()

        widgetPointer = gtk_toggle_button_new_with_label(label)
    }

    public init(mnemonicLabel label: String) {
        super.init()

        widgetPointer = gtk_toggle_button_new_with_mnemonic(label)
    }

    override func didMoveToParent() {
        super.didMoveToParent()

        addSignal(name: "toggled") { [unowned self] in self.toggled?(self) }
    }

    public var mode: Bool {
        get {
            return gtk_toggle_button_get_mode(castedPointer()).toBool()
        }
        set {
            gtk_toggle_button_set_mode(castedPointer(), newValue.toGBoolean())
        }
    }

    public var active: Bool {
        get {
            return gtk_toggle_button_get_active(castedPointer()).toBool()
        }
        set {
            gtk_toggle_button_set_active(castedPointer(), newValue.toGBoolean())
        }
    }

    public var inconsistent: Bool {
        get {
            return gtk_toggle_button_get_inconsistent(castedPointer()).toBool()
        }
        set {
            gtk_toggle_button_set_inconsistent(castedPointer(), newValue.toGBoolean())
        }
    }

    public var toggled: ((ToggleButton) -> Void)?
}
