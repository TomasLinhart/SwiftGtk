//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Application {
    let applicationPointer: UnsafeMutablePointer<GtkApplication>
    private(set) var applicationWindow: ApplicationWindow?
    private var windowCallback: ((ApplicationWindow) -> Void)?
    
    public init(applicationId: String) {
        applicationPointer = gtk_application_new(applicationId, G_APPLICATION_FLAGS_NONE)
    }

    @discardableResult
    public func run(_ windowCallback: @escaping (ApplicationWindow) -> Void) -> Int {
        self.windowCallback = windowCallback
        
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, data in
            let app = unsafeBitCast(data, to: Application.self)
            app.activate()
        }
        
        connectSignal(applicationPointer, name: "activate", data: Unmanaged.passUnretained(self).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))
        let status = g_application_run(applicationPointer.cast(), 0, nil)
        g_object_unref(applicationPointer)
        return Int(status)
    }
    
    private func activate() {
        let window = ApplicationWindow(application: self)
        windowCallback?(window)
        window.showAll()
        
        self.applicationWindow = window
    }
}
