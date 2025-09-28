//
//  File.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

struct Subscription<Output> {
    let receiveValue: (Output) -> Void
}
