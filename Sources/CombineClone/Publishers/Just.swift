//
//  Just.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

struct Just<Output>: Publisher {
    private let value: Output
    
    init(_ value: Output) {
        self.value = value
    }
    
    func sink(receiveValue: (Output) -> Void) {
        receiveValue(value)
    }
}
