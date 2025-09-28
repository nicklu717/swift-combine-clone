//
//  PassthroughSubjectTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Testing

@testable import CombineClone

@Suite
struct PassthroughSubjectTests {
    
    @Test
    func sinkAndSend() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int>()
        subject.sink { _output in
            output.append(_output)
        }
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [1])
        
        subject.send(2)
        #expect(output == [1, 2])
    }
}
