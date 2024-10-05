//
//  CalculatorButton.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/24/24.
//

import SwiftUI

struct CalculatorButton: View {
    private struct Constants {
        static let buttonSpacing = 16.0
        static let columnCount = 4.0
        static let cornerCount = 2 * columnCount
        static let fontScaleFactor = 0.1
        static let scaleFactor = 0.8
    }
    
    let buttonSpec: ButtonSpec
    let size: CGSize
    let calculator: CalculatorEngine
    
    var body: some View {
        Button {
            calculator.handleButtonTap(for: buttonSpec)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius(for: size))
                    .fill(backgroundColor)
                    .frame(
                        width: buttonSize(for: size, spanWidth: buttonSpec.type.spanWidth),
                        height: buttonSize(for: size, spanWidth: 1)
                    )
                Text(symbolString)
                    .font(displayFont(for: size))
                    .foregroundStyle(foregroundColor)
            }
        }
    }
    
    private var backgroundColor: Color {
        buttonSpec.symbol == calculator.activeSymbol
            ? buttonSpec.type.foregroundColor
            : buttonSpec.type.backgroundColor
    }
    
    private func buttonSize(for size: CGSize, spanWidth: Int) -> CGFloat {
        if spanWidth > 1 {
            return minimum(size) / Constants.columnCount * Constants.scaleFactor * CGFloat(spanWidth) + DrawingConstants.buttonSpacing
        }
        return minimum(size) / CGFloat(Constants.columnCount) * Constants.scaleFactor
    }
    
    private func cornerRadius (for size: CGSize) -> CGFloat {
        minimum(size) / Constants.cornerCount * Constants.scaleFactor
    }
    
    private func displayFont(for size: CGSize) -> Font {
        .system(size: minimum(size) * Constants.fontScaleFactor, weight: .light)
    }
    
    private var foregroundColor: Color {
        buttonSpec.symbol == calculator.activeSymbol
            ? buttonSpec.type.backgroundColor
            : buttonSpec.type.foregroundColor
    }
    
    private func minimum(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
    
    private var symbolString: String {
        if buttonSpec.symbol == .clear {
            calculator.clearSymbol
        } else {
            buttonSpec.symbol.rawValue
        }
    }
}
