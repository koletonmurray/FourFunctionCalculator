//
//  CalculatorBrain.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/27/24.
//

import Foundation

typealias BinaryOperation = (Double, Double) -> Double
typealias UnaryOperation = (Double) -> Double

struct CalculatorBrain {
    // MARK: - Nested types
    
    private enum Operation {
        case binary (BinaryOperation)
        case unary (UnaryOperation)
        case calculate
    }
    
    private struct PendingBinaryOperation {
        let calculate: (BinaryOperation)
        let leftOperand: Double
        let symbol: OperationSymbol
        
        func perform(with rightOperand: Double) -> Double {
            calculate(leftOperand, rightOperand)
        }
    }
    
    // MARK: - Constants
    
    private let operations: [OperationSymbol: Operation] = [
        .divide:        .binary({ $0 / $1 }),
        .multiply:      .binary({ ($0 * $1) }),
        .subtract:      .binary({ $0 - $1 }),
        .add:           .binary({ $0 + $1 }),
        .percent:       .unary({ $0 / 100 }),
        .changeSign:    .unary({ -$0 }),
        .calculate:     .calculate
    ]
    
    // MARK: - Properties
    
    private(set) var accumulator: Double? = 0
    private var pendingOperation: PendingBinaryOperation?
    
    var pendingLeftOperand: Double? {
        pendingOperation?.leftOperand
    }
    
    var pendingSymbol: OperationSymbol? {
        pendingOperation?.symbol
    }
    
    // MARK: - Helpers
    
    mutating func clearAccumulator() {
        accumulator = nil
    }
    
    mutating func clearAll() {
        pendingOperation = nil
        clearAccumulator()
    }
    
    mutating func performOperation(_ symbol: OperationSymbol) {
        guard let operation = operations[symbol] else {
            // Ignore attempt to perform unknown operations
            return
        }
        
        switch operation {
            case .binary(let function):
                performPendingOperation()
            
                if let accumulator {
                    pendingOperation = PendingBinaryOperation(
                        calculate: function,
                        leftOperand: accumulator,
                        symbol: symbol
                    )
                    clearAccumulator()
                }
            case .unary(let function):
                if let accumulator {
                    self.accumulator = function(accumulator)
                }
            case .calculate:
                performPendingOperation()
        }
        
    }
    
    mutating func setAccumulator (_ value: Double?) {
        accumulator = value
    }
    
    // MARK: - Private helpers
    
    mutating func performPendingOperation() {
        if let pendingOperation, let accumulator {
            self.accumulator = pendingOperation.perform(with: accumulator)
            self.pendingOperation = nil
        }
    }
}
