//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import Swift

extension Widget {
    func castedPointer<T>() -> UnsafeMutablePointer<T>? {
        return widgetPointer?.cast()
    }
}
