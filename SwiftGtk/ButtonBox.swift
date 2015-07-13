//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class ButtonBox: Box {
    public enum Orientation {
        case Horizontal
        case Vertical
        
        private func toGtkOrientation() -> GtkOrientation {
            switch self {
            case .Horizontal:
                return GTK_ORIENTATION_HORIZONTAL
            case .Vertical:
                return GTK_ORIENTATION_VERTICAL
            }
        }
    }
    
    public init(orientation: Orientation = .Horizontal) {
        super.init()
        widgetPointer = gtk_button_box_new(orientation.toGtkOrientation())
    }
}
