//
//  CurrentValueSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class CurrentValueSubject<Output>: Subject {
    private(set) var value: Output
    
    private var subscriptions: [Subscription<Output>] = []
    
    init(_ value: Output) {
        self.value = value
    }
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.subscriptions.append(Subscription(receiveValue: receiveValue))
    }
    
    func send(_ value: Output) {
        self.value = value
        subscriptions.forEach { $0.receiveValue(value) }
    }
}
