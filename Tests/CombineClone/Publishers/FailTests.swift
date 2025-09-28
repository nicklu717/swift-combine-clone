//
//  FailTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

import Testing
import Foundation

@testable import CombineClone

@Suite
struct FailTests {
    
    @Test
    func sink() throws {
        let error = NSError(domain: "", code: 0)
        var completion: Completion<Error>?
        Fail<Void, Error>(error).sink { _completion in
            completion = _completion
        }
        switch try #require(completion) {
        case .finished:
            #expect(Bool(false))
        case .failure(let _error as NSError):
            #expect(error == _error)
        }
    }
}
