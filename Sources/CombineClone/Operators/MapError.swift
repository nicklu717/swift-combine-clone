//
//  MapError.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public struct MapError<Upstream, Failure>: Publisher where Upstream: Publisher, Failure: Error {
    public typealias Output = Upstream.Output
    
    private let upstream: Upstream
    private let transform: (Upstream.Failure) -> Failure
    
    init(upstream: Upstream, transform: @escaping (Upstream.Failure) -> Failure) {
        self.upstream = upstream
        self.transform = transform
    }
    
    public func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable {
        return upstream.sink(
            receiveValue: receiveValue,
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    receiveCompletion(.finished)
                case .failure(let failure):
                    receiveCompletion(.failure(transform(failure)))
                }
            }
        )
    }
}
