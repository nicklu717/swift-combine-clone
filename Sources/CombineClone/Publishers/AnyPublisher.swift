//
//  AnyPublisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public struct AnyPublisher<Output, Failure>: Publisher where Failure: Error {
    
    private let publisher: any Publisher<Output, Failure>
    
    init(_ publisher: any Publisher<Output, Failure>) {
        self.publisher = publisher
    }
    
    public func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> any Cancellable {
        publisher.sink(receiveValue: receiveValue, receiveCompletion: receiveCompletion)
    }
}

// MARK: - Type Erasing
public extension Publisher {
    
    func eraseToAnyPublisher() -> AnyPublisher<Output, Failure> {
        return AnyPublisher(self)
    }
}
