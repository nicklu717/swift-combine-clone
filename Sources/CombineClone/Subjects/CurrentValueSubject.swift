//
//  CurrentValueSubject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class CurrentValueSubject<Output>: PassthroughSubject<Output> {
    private(set) var value: Output
    
    init(_ value: Output) {
        self.value = value
        super.init()
    }
    
    override func send(_ value: Output) {
        self.value = value
        super.send(value)
    }
}
