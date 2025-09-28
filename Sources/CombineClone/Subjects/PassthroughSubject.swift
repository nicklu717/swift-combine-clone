//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Foundation

class PassthroughSubject<Output>: Subject {
    private var subscriptions: [UUID: Subscription<Output>] = [:]
    
    func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion) -> Void) -> Cancellable {
        let id = UUID()
        let subscription = Subscription(
            receiveValue: receiveValue,
            receiveCompletion: receiveCompletion,
            receiveCancel: { [weak self] in
                self?.subscriptions[id] = nil
            }
        )
        subscriptions[id] = subscription
        return subscription
    }
    
    func send(_ value: Output) {
        subscriptions.forEach { _, subscription in
            subscription.send(value)
        }
    }
    
    func send(completion: Completion) {
        subscriptions.forEach { _, subscription in
            subscription.complete(completion)
        }
        subscriptions.removeAll()
    }
}
