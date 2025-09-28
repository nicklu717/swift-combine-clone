//
//  File.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class Subscription<Output> {
    let receiveValue: (Output) -> Void
    let receiveCancel: () -> Void
    
    private var isCancelled = false
    
    init(receiveValue: @escaping (Output) -> Void, receiveCancel: @escaping () -> Void) {
        self.receiveValue = receiveValue
        self.receiveCancel = receiveCancel
    }
}

// MARK: - Cancellable
extension Subscription: Cancellable {
    
    func cancel() {
        guard !isCancelled else { return }
        isCancelled = true
        receiveCancel()
    }
}
