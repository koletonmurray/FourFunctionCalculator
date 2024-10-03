//
//  CalculatorView.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/21/24.
//

import SwiftUI

let columnCount = 4
let gridItems = Array<GridItem>(repeating: .init(.flexible()), count: columnCount)

struct CalculatorView: View {
    
    struct Constants {
        static let displayFontSize = 90.0
    }
    
    @Bindable var calculatorViewModel: CalculatorViewModel
        
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

                        Toggle(isOn: $calculatorViewModel.preferences.soundIsEnabled) {}
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
                        ForEach(buttonSpecs, id: \.symbol.rawValue) { buttonSpec in
                            if buttonSpec.symbol == .placeholder {
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
