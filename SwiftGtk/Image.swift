//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

import CGtk

public class Image: Widget {
    public init(filename: String) {
        super.init()
        
        widgetPointer = gtk_image_new_from_file(filename)
    }
}
