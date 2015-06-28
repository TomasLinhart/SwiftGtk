//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class Application {
    private let application: UnsafeMutablePointer<GtkApplication>
    private (set) var applicationWindow: ApplicationWindow?
    private var windowCallback: ((window: ApplicationWindow) -> Void)?
    
    public init(applicationId: String) {
        application = gtk_application_new(applicationId, G_APPLICATION_FLAGS_NONE)
    }
    
    public func run(windowCallback: (window: ApplicationWindow) -> Void) -> Int {
        self.windowCallback = windowCallback
        
        var selfCopy = self
        connectSignal(application, name: "activate", data: &selfCopy) { sender, data in
            let app = UnsafeMutablePointer<Application>(data).memory
            app.activate()
        }
        let status = g_application_run(UnsafeMutablePointer<GApplication>(application), 0, nil)
        g_object_unref(application)
        return Int(status)
    }
    
    private func activate() {
        let window = ApplicationWindow(application: self)
        windowCallback?(window: window)
        gtk_widget_show_all(window.gtkPointer)
        
        self.applicationWindow = window
    }
    
    var gtkPointer: UnsafeMutablePointer<GtkApplication> {
        return application
    }
}
