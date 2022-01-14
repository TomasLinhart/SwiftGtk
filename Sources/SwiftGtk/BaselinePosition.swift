//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public enum BaselinePosition {
    case top
    case center
    case bottom

    func toGtkBaselinePosition() -> GtkBaselinePosition {
        switch self {
        case .top:
            return GTK_BASELINE_POSITION_TOP
        case .center:
            return GTK_BASELINE_POSITION_CENTER
        case .bottom:
            return GTK_BASELINE_POSITION_BOTTOM
        }
    }
}

extension GtkBaselinePosition {
    func toBaselinePosition() -> BaselinePosition {
        switch self {
        case GTK_BASELINE_POSITION_TOP:
            return .top
        case GTK_BASELINE_POSITION_CENTER:
            return .center
        case GTK_BASELINE_POSITION_BOTTOM:
            return .bottom
        default:
            return .center
        }
    }
}
