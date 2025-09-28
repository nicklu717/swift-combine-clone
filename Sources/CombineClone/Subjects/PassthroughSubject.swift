//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Foundation

class PassthroughSubject<Output>: Subject {
    private var subscriptions: [UUID: Subscription<Output>] = [:]
    
    func sink(receiveValue: @escaping (Output) -> Void) -> Cancellable {
        let id = UUID()
        let subscription = Subscription(
            receiveValue: receiveValue,
            receiveCancel: { [weak self] in
                self?.subscriptions[id] = nil
            }
        )
        subscriptions[id] = subscription
        return subscription
    }
    
    func send(_ value: Output) {
        subscriptions.forEach { _, subscription in
            subscription.receiveValue(value)
        }
    }
}
