//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class PassthroughSubject<Output>: Subject {
    private var subscriptions: [Subscription<Output>] = []
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.subscriptions.append(Subscription(receiveValue: receiveValue))
    }
    
    func send(_ value: Output) {
        subscriptions.forEach { $0.receiveValue(value) }
    }
}
