//
//  CalculatorView.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/21/24.
//

import SwiftUI

typealias ButtonSpec = (label: String, type: CalculatorButtonType)

let buttonSpecs: [ButtonSpec] = [
    ("AC", .utility),   ("+/-", .utility),  ("%", .utility),    ("÷", .compute),
    ("7", .number),     ("8", .number),     ("9", .number),     ("×", .compute),
    ("4", .number),     ("5", .number),     ("6", .number),     ("-", .compute),
    ("1", .number),     ("2", .number),     ("3", .number),     ("+", .compute),
    ("0", .doublewide), ("", .number),    (".", .utility),    ("=", .compute)
]

let columnCount = 4
let gridItems = Array<GridItem>(repeating: .init(.flexible()), count: columnCount)

struct CalculatorView: View {
    
    struct Constants {
        static let buttonSpacing = 16.0
        static let displayFontSize = 90.0
    }
    
    var calculatorViewModel: CalculatorViewModel
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle ()
                    .fill(.black)
                    .ignoresSafeArea()
                
                VStack (alignment: .trailing, spacing: Layout.buttonSpacing) {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "speaker.wave.2")
                            .foregroundColor(.utilityBackground)
                            .font(.system(size: 24, weight: .medium))

                        Toggle(isOn: Binding(
                            get: { calculatorViewModel.isMuted },
                            set: { _ in calculatorViewModel.toggleMute() }
                        )) {}
                            .labelsHidden()
                            .tint(.red)
                        
                        Image(systemName: "speaker.slash")
                            .foregroundColor(.utilityBackground)
                            .font(.system(size: 24, weight: .medium))
                        
                    }
                    
                    Spacer()
                    
                    Text("1,000")
                        .font(.system(size: Constants.displayFontSize, weight: .thin))
                        .foregroundStyle(.white)
                        .padding(.trailing, Layout.buttonSpacing)
                    
                    LazyVGrid(columns: gridItems, alignment: .leading, spacing: Layout.buttonSpacing) {
                        ForEach(buttonSpecs, id: \.label) { buttonSpec in
                            if buttonSpec.label.isEmpty {
                                Text("")
                            } else {
                                CalculatorButton(
                                    buttonSpec: buttonSpec,
                                    size: geometry.size,
                                    calculatorViewModel: calculatorViewModel
                                )
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CalculatorView(calculatorViewModel: CalculatorViewModel())
}
