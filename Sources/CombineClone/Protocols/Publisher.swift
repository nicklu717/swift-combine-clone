//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

protocol Publisher {
    associatedtype Output
    associatedtype Failure: Error
    
    func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion<Failure>) -> Void) -> Cancellable
}

enum Completion<Failure> where Failure: Error {
    case finished
    case failure(Failure)
}

protocol Cancellable {
    func cancel()
}
