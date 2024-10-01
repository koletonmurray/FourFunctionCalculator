//
//  FourFunctionCalculatorApp.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/21/24.
//

import SwiftUI

@main
struct FourFunctionCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(calculatorViewModel: CalculatorViewModel())
        }
    }
}
