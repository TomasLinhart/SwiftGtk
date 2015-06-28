//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import Foundation
import Gtk

public class ApplicationWindow: Window {
    public init(application: Application) {
        super.init()
        gtkPointer = UnsafeMutablePointer<GtkWidget>(gtk_application_window_new(application.gtkPointer))
    }
    
    override func setup() {
        
    }
}
