//
//  PassthroughSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class PassthroughSubject<Output>: Subject {
    private var receiveValue: ((Output) -> Void)?
    
    func sink(receiveValue: @escaping (Output) -> Void) {
        self.receiveValue = receiveValue
    }
    
    func send(_ value: Output) {
        receiveValue?(value)
    }
}
