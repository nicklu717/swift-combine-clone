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
