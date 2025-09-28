//
//  CurrentValueSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class CurrentValueSubject<Output>: Subject {
    private(set) var value: Output
    
    private var receiveValue: ((Output) -> Void)?
    
    init(_ value: Output) {
        self.value = value
    }
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.receiveValue = receiveValue
    }
    
    func send(_ value: Output) {
        self.value = value
        receiveValue?(value)
    }
}
