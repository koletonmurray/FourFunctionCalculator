//
//  CalculatorButtonType.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/24/24.
//

import Foundation

enum CalculatorButtonType {
    case utility
    case compute
    case number
    case doubleWide
}

enum OperationSymbol: String, Hashable {
    case divide = "÷"
    case multiply = "×"
    case subtract = "-"
    case add = "+"
    case changeSign = "+/-"
    case percent = "%"
    case calculate = "="
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case clear = "C"
    case allClear = "AC"
    case placeholder = ""
}

typealias ButtonSpec = (symbol: OperationSymbol, type: CalculatorButtonType)

let buttonSpecs: [ButtonSpec] = [
    (.clear, .utility),
    (.changeSign, .utility),
    (.percent, .utility),
    (.multiply, .compute),
    (.seven, .number),
    (.eight, .number),
    (.nine, .number),
    (.divide, .compute),
    (.four, .number),
    (.five, .number),
    (.six, .number),
    (.subtract, .compute),
    (.one, .number),
    (.two, .number),
    (.three, .number),
    (.add, .compute),
    (.zero, .doubleWide),
    (.placeholder, .number),
    (.decimal, .number),
    (.calculate, .compute)
]
