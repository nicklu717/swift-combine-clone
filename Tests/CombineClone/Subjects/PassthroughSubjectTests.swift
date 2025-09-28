//
//  PassthroughSubjectTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Testing
import Foundation

@testable import CombineClone

@Suite
struct PassthroughSubjectTests {
    
    @Test
    func sinkAndSend() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, Never>()
        _ = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [1])
        
        subject.send(2)
        #expect(output == [1, 2])
    }
    
    @Test
    func multipleSinkAndSend() {
        var output1: [Int] = []
        var output2: [Int] = []
        let subject = PassthroughSubject<Int, Never>()
        _ = subject
            .sink(
                receiveValue: { _output in
                    output1.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output1 == [])
        #expect(output2 == [])
        
        subject.send(1)
        #expect(output1 == [1])
        #expect(output2 == [])
        
        _ = subject
            .sink(
                receiveValue: { _output in
                    output2.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output1 == [1])
        #expect(output2 == [])
        
        subject.send(2)
        #expect(output1 == [1, 2])
        #expect(output2 == [2])
    }
    
    @Test
    func finish() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, Never>()
        _ = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [1])
        
        subject.send(completion: .finished)
        subject.send(2)
        #expect(output == [1])
    }
    
    @Test
    func failure() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, Error>()
        _ = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [1])
        
        subject.send(completion: .failure(NSError(domain: "", code: 0)))
        subject.send(2)
        #expect(output == [1])
    }
    
    @Test
    func cancel() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, Never>()
        let cancellable = subject
            .sink(
                receiveValue: { _output in
                    output.append(_output)
                },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [1])
        
        cancellable.cancel()
        subject.send(2)
        #expect(output == [1])
    }
}
