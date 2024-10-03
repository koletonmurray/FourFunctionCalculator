//
//  CalculatorViewModel.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/26/24.
//

import Foundation

@Observable class CalculatorViewModel {
    // MARK: - Properties
    
    var preferences = Preferences()
    
    private var calculatorModel = CalculatorBrain()
    private var soundPlayer = SoundPlayer()

    // MARK: - Model Access
    
    
    
    // MARK: - User Intents
    
    func handleButtonTap(for buttonsSpec: ButtonSpec) {
        if !preferences.soundIsEnabled {
            soundPlayer.playSound(named: "Tap.mp3")
        }
    }
    
    // MARK: - Helpers
    
    
    
}
