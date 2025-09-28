//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

public protocol Publisher {
    associatedtype Output
    associatedtype Failure: Error
    
    func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable
}

public enum Completion<Failure> where Failure: Error {
    case finished
    case failure(Failure)
}

public protocol Cancellable {
    func cancel()
}
