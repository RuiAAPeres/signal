//
//  Signal.swift
//  signal
//
//  Created by Rui Peres on 11/05/2016.
//  Copyright © 2016 Rui Peres. All rights reserved.
//

final class Signal<T> {
    private let subscribers: Locker<[Subscriber<T>]> = Locker([])
    
    func update(value: T) {
        for subscriber in subscribers.value {
            subscriber.next(value)
        }
    }
}

extension Signal {
    func subscribeNext(next: T -> Void) {
        subscribe(Subscriber(next))
    }
    
    func subscribe(subscriber: Subscriber<T>) {
        subscribers.modify {
            return $0 + [subscriber]
        }
    }
}
