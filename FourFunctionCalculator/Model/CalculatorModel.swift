//
//  CalculatorModel.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/27/24.
//
// chatGPT helped me build out the basic structure for this model

import Foundation

enum CalculatorOperation: String {
    case addition
    case subtraction
    case multiplication
    case division
    case none
}

class CalculatorModel {
    // MARK: - Properties
    private var currentNumber = 0.0
    private var previousNumber = 0.0
    private var operation = CalculatorOperation.none
    
    // MARK: - Methods
    
    func performOperation (_ operation: CalculatorOperation) {
        switch operation {
            case .addition:
                currentNumber += previousNumber
            case .subtraction:
                currentNumber -= previousNumber
            case .multiplication:
                currentNumber *= previousNumber
            case .division:
                if currentNumber != 0 {
                    currentNumber /= previousNumber
                }
            case .none:
                break
        }
    }
    
    func inputNumber (_ number: Double) {
        currentNumber = number
    }
    
    func clear () {
        currentNumber = 0.0
        previousNumber = 0.0
        operation = CalculatorOperation.none
    }
    
    func getCurrentValue () -> Double {
        return currentNumber
    }
}
