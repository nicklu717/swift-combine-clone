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
        _ = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        #expect(subject.value == 0)
        
        subject.send(1)
        #expect(output == [1])
        #expect(subject.value == 1)
        
        subject.send(2)
        #expect(output == [1, 2])
        #expect(subject.value == 2)
    }
    
    @Test
    func multipleSinkAndSend() {
        var output1: [Int] = []
        var output2: [Int] = []
        let subject = CurrentValueSubject<Int>(0)
        _ = subject
            .sink(
                receiveValue: { _output in
                    output1.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output1 == [])
        #expect(output2 == [])
        #expect(subject.value == 0)
        
        subject.send(1)
        #expect(output1 == [1])
        #expect(output2 == [])
        #expect(subject.value == 1)
        
        _ = subject
            .sink(
                receiveValue: { _output in
                    output2.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output1 == [1])
        #expect(output2 == [])
        #expect(subject.value == 1)
        
        subject.send(2)
        #expect(output1 == [1, 2])
        #expect(output2 == [2])
        #expect(subject.value == 2)
    }
    
    @Test
    func finish() {
        var output: [Int] = []
        let subject = CurrentValueSubject<Int, Never>(0)
        _ = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        #expect(subject.value == 0)
        
        subject.send(1)
        #expect(output == [1])
        #expect(subject.value == 1)
        
        subject.send(completion: .finished)
        subject.send(2)
        #expect(output == [1])
        #expect(subject.value == 2)
    }
    
    @Test
    func cancel() {
        var output: [Int] = []
        let subject = CurrentValueSubject<Int>(0)
        let cancellable = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        #expect(subject.value == 0)
        
        subject.send(1)
        #expect(output == [1])
        #expect(subject.value == 1)
        
        cancellable.cancel()
        
        subject.send(2)
        #expect(output == [1])
        #expect(subject.value == 2)
    }
}
