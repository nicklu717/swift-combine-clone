//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

protocol Publisher {
    associatedtype Output
    
    func sink(receiveValue: @escaping (Output) -> Void, receiveCompletion: @escaping (Completion) -> Void) -> Cancellable
}

enum Completion {
    case finished
}

protocol Cancellable {
    func cancel()
}
