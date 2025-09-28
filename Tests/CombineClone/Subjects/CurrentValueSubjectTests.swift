//
//  CurrentValueSubjectTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Testing

@testable import CombineClone

@Suite
struct CurrentValueSubjectTests {
    
    @Test
    func sinkAndSend() {
        var output: [Int] = []
        let subject = CurrentValueSubject<Int>(0)
        subject.sink { _output in
            output.append(_output)
        }
        #expect(output == [])
        #expect(subject.value == 0)
        
        subject.send(1)
        #expect(output == [1])
        #expect(subject.value == 1)
        
        subject.send(2)
        #expect(output == [1, 2])
        #expect(subject.value == 2)
    }
}
