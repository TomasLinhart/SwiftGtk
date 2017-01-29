//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public enum Orientation {
    case horizontal
    case vertical

    func toGtkOrientation() -> GtkOrientation {
        switch self {
        case .horizontal:
            return GTK_ORIENTATION_HORIZONTAL
        case .vertical:
            return GTK_ORIENTATION_VERTICAL
        }
    }
}
