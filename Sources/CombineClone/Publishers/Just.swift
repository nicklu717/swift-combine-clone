//
//  Just.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

struct Just<Output>: Publisher {
    private let value: Output
    
    init(_ value: Output) {
        self.value = value
    }
    
    @discardableResult
    func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion) -> Void = { _ in }) -> Cancellable {
        receiveValue(value)
        return Subscription(receiveValue: receiveValue, receiveCompletion: receiveCompletion, receiveCancel: {})
    }
}
