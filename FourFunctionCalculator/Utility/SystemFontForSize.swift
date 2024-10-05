//
//  SystemFontForSize.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 10/4/24.
//

import SwiftUI

func systemFont(for string: String, thatFits width: Double, desiredSize: Double) -> Font {
    var fontSize = desiredSize
    var uiFont = UIFont.systemFont(ofSize: fontSize, weight: .thin)
    
    while (string as NSString).size(withAttributes: [.font: uiFont]).width > width
        && fontSize > desiredSize / 3 {
        fontSize *= 0.95
        uiFont = UIFont.systemFont(ofSize: fontSize, weight: .thin)
    }
    
    return Font.system(size: fontSize, weight: .thin)
}
