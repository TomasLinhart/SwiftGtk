//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public enum PositionType {
    case left
    case right
    case top
    case bottom

    func toGtkPositionType() -> GtkPositionType {
        switch self {
        case .left:
            return GTK_POS_LEFT
        case .right:
            return GTK_POS_RIGHT
        case .top:
            return GTK_POS_TOP
        case .bottom:
            return GTK_POS_BOTTOM
        }
    }
}
