//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class ButtonBox: Box {
    public init(orientation: Orientation = .horizontal) {
        super.init(orientation: orientation, spacing: 0)

        widgetPointer = gtk_button_box_new(orientation.toGtkOrientation())
    }
}
