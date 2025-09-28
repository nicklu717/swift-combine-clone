//
//  MapTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

import Testing

@testable import CombineClone

@Suite
struct MapTests {
    
    enum TestError: Error {
        case test
    }
    
    @Test
    func mapOutput() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, TestError>()
        _ = subject
            .map { $0 * 2 }
            .sink(
                receiveValue: { output.append($0) },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [2])
        
        subject.send(2)
        #expect(output == [2, 4])
        
        subject.send(completion: .finished)
        subject.send(3)
        #expect(output == [2, 4])
    }
    
    @Test
    func mapFailure() {
        var output: [Int] = []
        let subject = PassthroughSubject<Int, TestError>()
        _ = subject
            .map { $0 * 2 }
            .sink(
                receiveValue: { output.append($0) },
                receiveCompletion: { _ in }
            )
        #expect(output == [])
        
        subject.send(1)
        #expect(output == [2])
        
        subject.send(2)
        #expect(output == [2, 4])
        
        subject.send(completion: .failure(.test))
        subject.send(3)
        #expect(output == [2, 4])
    }
}
