//
//  Just.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public struct Just<Output>: Publisher {
    public typealias Failure = Never
    
    private let value: Output
    
    public init(_ value: Output) {
        self.value = value
    }
    
    @discardableResult
    public func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void = { _ in }) -> Cancellable {
        receiveValue(value)
        return Subscription(receiveValue: receiveValue, receiveCompletion: receiveCompletion, receiveCancel: {})
    }
}
