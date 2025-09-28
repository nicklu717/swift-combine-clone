//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

public extension Publisher {
    
    func map<NewOutput>(_ transform: @escaping (Output) -> NewOutput) -> Map<Self, NewOutput> {
        return Map<Self, NewOutput>(upstream: self, transform: transform)
    }
    
    func mapError<NewFailure>(_ transform: @escaping (Failure) -> NewFailure) -> MapError<Self, NewFailure> {
        return MapError(upstream: self, transform: transform)
    }
}
