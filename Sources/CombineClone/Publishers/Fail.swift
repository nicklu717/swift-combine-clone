//
//  Fail.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public struct Fail<Output, Failure>: Publisher where Failure: Error {
    private let error: Failure
    
    public init(_ error: Failure) {
        self.error = error
    }
    
    @discardableResult
    public func sink(receiveValue: @escaping (Output) -> Void = { _ in }, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable {
        receiveCompletion(.failure(error))
        return Subscription(receiveValue: receiveValue, receiveCompletion: receiveCompletion, receiveCancel: {})
    }
}
