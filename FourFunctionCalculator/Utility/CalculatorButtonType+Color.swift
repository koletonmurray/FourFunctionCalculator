//
//  CalculatorButtonType+Color.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 10/1/24.
//

import SwiftUI

extension CalculatorButtonType {
    var backgroundColor: Color {
        switch self {
            case .utility:
                .utilityBackground
            case .compute:
                .computeBackground
            case .number, .doubleWide:
                .numberBackground
        }
    }
    var foregroundColor: Color {
        self == .utility ? .black : .white
    }
    
    var spanWidth: Int {
        self == .doubleWide ? 2 : 1
    }
}
