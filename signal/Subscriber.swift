//
//  Subscriber.swift
//  signal
//
//  Created by Rui Peres on 11/05/2016.
//  Copyright © 2016 Rui Peres. All rights reserved.
//

struct Subscriber<T> {
    let next: T -> Void
}