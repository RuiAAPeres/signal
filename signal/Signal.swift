//
//  Signal.swift
//  signal
//
//  Created by Rui Peres on 11/05/2016.
//  Copyright © 2016 Rui Peres. All rights reserved.
//

final class Signal<T> {
    let subscribers: Locker<[T -> Void]> = Locker([])
    
    func update(value: T) {
        for subscriber in subscribers.value {
            subscriber(value)
        }
    }
}