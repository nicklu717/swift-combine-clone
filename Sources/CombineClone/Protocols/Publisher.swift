//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

protocol Publisher {
    associatedtype Output
    
    func sink(receiveValue: @escaping (Output) -> Void, receiveFinished: @escaping () -> Void) -> Cancellable
}

protocol Cancellable {
    func cancel()
}
