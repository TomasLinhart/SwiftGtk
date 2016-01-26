//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Container: Widget {
    private (set) var widgets: [Widget] = []
    
    public func add(widget: Widget) {
        widgets.append(widget)
        widget.parentWidget = self
        gtk_container_add(UnsafeMutablePointer(widgetPointer), widget.widgetPointer)
    }
    
    public func remove(widget: Widget) {
        if let index = widgets.indexOf({ $0 === widget }) {
            gtk_container_remove(UnsafeMutablePointer(widgetPointer), widget.widgetPointer)
            widgets.removeAtIndex(index)
            widget.parentWidget = nil
        }
    }
}
