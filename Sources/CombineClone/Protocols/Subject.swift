//
//  Subject.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

public protocol Subject: Publisher {
    func send(_ value: Output)
    func send(completion: Completion<Failure>)
}
