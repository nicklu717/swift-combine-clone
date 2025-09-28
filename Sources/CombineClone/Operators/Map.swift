//
//  File.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public struct Map<Upstream, Output>: Publisher where Upstream: Publisher {
    public typealias Failure = Upstream.Failure
    
    private let upstream: Upstream
    private let transform: (Upstream.Output) -> Output
    
    init(upstream: Upstream, transform: @escaping (Upstream.Output) -> Output) {
        self.upstream = upstream
        self.transform = transform
    }
    
    public func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable {
        return upstream.sink(
            receiveValue: { receiveValue(transform($0)) },
            receiveCompletion: receiveCompletion
        )
    }
}

public extension Publisher {
    
    func map<NewOutput>(_ transform: @escaping (Output) -> NewOutput) -> Map<Self, NewOutput> {
        return Map<Self, NewOutput>(upstream: self, transform: transform)
    }
}
