//
//  CurrentValueSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class CurrentValueSubject<Output>: Subject {
    private(set) var value: Output
    
    private var subscription: Subscription<Output>?
    
    init(_ value: Output) {
        self.value = value
    }
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.subscription = Subscription(receiveValue: receiveValue)
    }
    
    func send(_ value: Output) {
        self.value = value
        subscription?.receiveValue(value)
    }
}
