//
//  Locker.swift
//  signal
//
//  Created by Rui Peres on 11/05/2016.
//  Copyright © 2016 Rui Peres. All rights reserved.
//

import Foundation

final class Locker<T> {
    
    private let lock = dispatch_queue_create("locker.queue", DISPATCH_QUEUE_CONCURRENT)
    private var _value: T
    
    init(_ value: T) {
        _value = value
    }
    
    func write(newValue: T)  {
        dispatch_barrier_async(lock) {
            self._value = newValue
        }
    }
    
    var value: T {
        var readValue: T!
        dispatch_sync(lock) {[_value] in
            readValue = _value
        }
        return readValue
    }
}
