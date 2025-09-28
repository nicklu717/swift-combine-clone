//
//  JustTests.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/27.
//

import Testing

@testable import CombineClone

@Suite
struct JustTests {
    
    @Test
    func sink() {
        let number = 1
        var output: Int?
        Just(number).sink { _output in
            output = _output
        }
        #expect(output == number)
    }
}
