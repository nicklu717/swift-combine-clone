//
//  File.swift
//  combine-clone
//
//  Created by 陸瑋恩 on 2025/9/28.
//

class Subscription<Output> {
    private let receiveValue: (Output) -> Void
    private let receiveFinished: () -> Void
    private let receiveCancel: () -> Void
    
    private var state: State = .valid
    
    init(
        receiveValue: @escaping (Output) -> Void,
        receiveFinished: @escaping () -> Void,
        receiveCancel: @escaping () -> Void
    ) {
        self.receiveValue = receiveValue
        self.receiveFinished = receiveFinished
        self.receiveCancel = receiveCancel
    }
    
    func send(_ value: Output) {
        guard state.isValid else { return }
        receiveValue(value)
    }
    
    func finish() {
        guard state.isValid else { return }
        state = .finished
        receiveFinished()
    }
}

// MARK: - State
extension Subscription {
    
    enum State {
        case valid, finished, cancelled
        
        var isValid: Bool {
            return self == .valid
        }
    }
}

// MARK: - Cancellable
extension Subscription: Cancellable {
    
    func cancel() {
        guard state.isValid else { return }
        state = .cancelled
        receiveCancel()
    }
}
