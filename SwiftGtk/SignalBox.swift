//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

protocol SignalBox {
    typealias CallbackType
    
    var callback: CallbackType { get }
    
    init(callback: CallbackType)
}

typealias SignalCallbackZero = () -> Void
typealias SignalCallbackOne = (UnsafeMutablePointer<Void>) -> Void
typealias SignalCallbackTwo = (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void
typealias SignalCallbackThree = (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void
typealias SignalCallbackFour = (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void
typealias SignalCallbackFive = (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void

/// Provides a box that captures a callback for a signal so it makes easier to add signals.
class SignalBoxZero: SignalBox {
    typealias CallbackType = SignalCallbackZero
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}

class SignalBoxOne: SignalBox {
    typealias CallbackType = SignalCallbackOne
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}

class SignalBoxTwo: SignalBox {
    typealias CallbackType = SignalCallbackTwo
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}

class SignalBoxThree: SignalBox {
    typealias CallbackType = SignalCallbackThree
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}

class SignalBoxFour: SignalBox {
    typealias CallbackType = SignalCallbackFour
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}

class SignalBoxFive: SignalBox {
    typealias CallbackType = SignalCallbackFive
    
    let callback: CallbackType
    
    required init(callback: CallbackType) {
        self.callback = callback
    }
}