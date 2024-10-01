//
//  CalculatorButtonType.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/24/24.
//

import SwiftUI

enum CalculatorButtonType {
    case utility
    case compute
    case number
    case doublewide
    
    var backgroundColor: Color {
        switch self {
            case .utility:
                .utilityBackground
            case .compute:
                .computeBackground
            case .number, .doublewide:
                .numberBackground
        }
    }
    var foregroundColor: Color {
        self == .utility ? .black : .white
    }
    
    var spanWidth: Int {
        self == .doublewide ? 2 : 1
    }
}
