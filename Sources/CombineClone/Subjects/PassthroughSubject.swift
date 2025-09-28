//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Foundation

open class PassthroughSubject<Output, Failure>: Subject where Failure: Error {
    private var subscriptions: [UUID: Subscription<Output, Failure>] = [:]
    
    public func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable {
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
    
    open func send(_ value: Output) {
        subscriptions.forEach { _, subscription in
            subscription.send(value)
        }
    }
    
    open func send(completion: Completion<Failure>) {
        subscriptions.forEach { _, subscription in
            subscription.complete(completion)
        }
        subscriptions.removeAll()
    }
}
