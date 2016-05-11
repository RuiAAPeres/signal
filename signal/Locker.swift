//
//  Locker.swift
//  signal
//
//  Created by Rui Peres on 11/05/2016.
//  Copyright © 2016 Rui Peres. All rights reserved.
//

import Foundation

final class Locker<Item> {
    
    private let lock = dispatch_queue_create("locker.queue", DISPATCH_QUEUE_CONCURRENT)
    private var _value: Item
    
    init(_ value: Item) {
        _value = value
    }
    
    func tranform(f: Item -> Item) {
        dispatch_barrier_async(lock) {
            self._value = f(self._value)
        }
    }
    
    func write(newValue: Item)  {
        tranform { _ in newValue }
    }
    
    var value: Item{
        var readValue: Item!
        dispatch_sync(lock) {[_value] in
            readValue = _value
        }
        return readValue
    }
}
