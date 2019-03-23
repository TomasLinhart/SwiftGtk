//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public class HeaderBar: Container {
    public override init() {
        super.init()

        widgetPointer = gtk_header_bar_new()
    }

    public var title: String? {
        get { return gtk_header_bar_get_title(castedPointer())?.toString() }
        set { gtk_header_bar_set_title(castedPointer(), newValue) }
    }

    public var subtitle: String? {
        get { return gtk_header_bar_get_subtitle(castedPointer())?.toString() }
        set { gtk_header_bar_set_subtitle(castedPointer(), newValue) }
    }

    public var hasSubtitle: Bool {
        get { return gtk_header_bar_get_has_subtitle(castedPointer()).toBool() }
        set { gtk_header_bar_set_has_subtitle(castedPointer(), newValue.toGBoolean()) }
    }

    private var _customTitle: Widget?
    public var customTitle: Widget? {
        get { return _customTitle }
        set { gtk_header_bar_set_custom_title(castedPointer(), newValue?.widgetPointer) }
    }

    public var showCloseButton: Bool {
        get { return gtk_header_bar_get_show_close_button(castedPointer()).toBool() }
        set { gtk_header_bar_set_show_close_button(castedPointer(), newValue.toGBoolean()) }
    }

    public var decorationLayout: String? {
        get { return gtk_header_bar_get_decoration_layout(castedPointer())?.toString() }
        set { gtk_header_bar_set_decoration_layout(castedPointer(), newValue) }
    }

    public var spacing: Int {
        get { return getProperty(castedPointer(), name: "spacing") }
        set { setProperty(castedPointer(), name: "spacing", newValue: newValue) }
    }

    public func packStart(child: Widget) {
        widgets.append(child)
        gtk_header_bar_pack_start(castedPointer(), child.widgetPointer)
    }

    public func packEnd(child: Widget) {
        widgets.append(child)
        gtk_header_bar_pack_end(castedPointer(), child.widgetPointer)
    }
}
