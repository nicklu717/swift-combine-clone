//
//  Publisher.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

protocol Publisher {
    associatedtype Output
    
    func sink(receiveValue: (Output) -> Void)
}
