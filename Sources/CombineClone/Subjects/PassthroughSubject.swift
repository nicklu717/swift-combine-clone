//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class PassthroughSubject<Output>: Subject {
    private var subscription: Subscription<Output>?
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.subscription = Subscription(receiveValue: receiveValue)
    }
    
    func send(_ value: Output) {
        subscription?.receiveValue(value)
    }
}
