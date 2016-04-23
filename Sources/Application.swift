//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Application {
    let applicationPointer: UnsafeMutablePointer<GtkApplication>
    private (set) var applicationWindow: ApplicationWindow?
    private var windowCallback: ((window: ApplicationWindow) -> Void)?

    public init(applicationId: String) {
        applicationPointer = gtk_application_new(applicationId, G_APPLICATION_FLAGS_NONE)
    }

    public func run(windowCallback: (window: ApplicationWindow) -> Void) -> Int {
        self.windowCallback = windowCallback

        let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, data in
            let app = unsafeBitCast(_: data, to: Application.self)
            app.activate()
        }

        connectSignal(instance:applicationPointer, name: "activate", data: unsafeAddress(of: self), handler: unsafeBitCast(_: handler, to: GCallback.self))
        let status = g_application_run(UnsafeMutablePointer(applicationPointer), 0, nil)
        g_object_unref(applicationPointer)
        return Int(status)
    }

    private func activate() {
        let window = ApplicationWindow(application: self)
        windowCallback?(window: window)
        window.showAll()

        self.applicationWindow = window
    }
}
