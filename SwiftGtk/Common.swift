//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

import Gtk

extension gboolean {
    func toBool() -> Bool {
        return self == 1
    }
}

extension Bool {
    func toGBoolean() -> gboolean {
        return self ? 1 : 0
    }
}