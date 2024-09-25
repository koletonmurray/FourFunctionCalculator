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
    
    var body: some View {
        Button {
            // NEEDSWORK
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius(for: size))
                    .fill(buttonSpec.type.backgroundColor)
                    .frame(
                        width: buttonSize(for: size, spanWidth: buttonSpec.type.spanWidth),
                        height: buttonSize(for: size, spanWidth: 1)
                    )
                Text(buttonSpec.label)
                    .font(displayFont(for: size))
                    .foregroundStyle(buttonSpec.type.foregroundColor)
            }
        }
    }
    func buttonSize(for size: CGSize, spanWidth: Int) -> CGFloat {
        if spanWidth > 1 {
            return minimum(size) / Constants.columnCount * Constants.scaleFactor * CGFloat(spanWidth) + Layout.buttonSpacing
        }
        return minimum(size) / CGFloat(Constants.columnCount) * Constants.scaleFactor
    }
    
    func cornerRadius (for size: CGSize) -> CGFloat {
        minimum(size) / Constants.cornerCount * Constants.scaleFactor
    }
    
    func displayFont(for size: CGSize) -> Font {
        .system(size: minimum(size) * Constants.fontScaleFactor, weight: .light)
    }
    
    func minimum(_ size: CGSize) -> CGFloat {
        min(size.width, size.height)
    }
}
