//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class ButtonBox: Box {
    public enum Orientation {
        case horizontal
        case vertical

        fileprivate func toGtkOrientation() -> GtkOrientation {
            switch self {
            case .horizontal:
                return GTK_ORIENTATION_HORIZONTAL
            case .vertical:
                return GTK_ORIENTATION_VERTICAL
            }
        }
    }

    public init(orientation: Orientation = .horizontal) {
        super.init()
        widgetPointer = gtk_button_box_new(orientation.toGtkOrientation())
    }
}
