//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

open class Box: Container {
    public init(orientation: Orientation, spacing: Int) {
        super.init()

        widgetPointer = gtk_box_new(orientation.toGtkOrientation(), gint(spacing))
    }
}
