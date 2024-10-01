//
//  CalculatorViewModel.swift
//  FourFunctionCalculator
//
//  Created by Koleton Murray on 9/26/24.
//

import Foundation

@Observable class CalculatorViewModel {
    // MARK: - Properties
    
    private var soundPlayer = SoundPlayer()
    
    var isMuted = false
    
    // MARK: - Model Access
    
    func getCurrentValue() {}
    
    func getDisplayValue() {}
    
    
    
    // MARK: - User Intents
    
    func clickButton() {
        if !isMuted {
            soundPlayer.playSound(named: "Tap.mp3")
        }
    }
    
    func toggleMute() {
        isMuted.toggle()
    }
    
    func calculate() {}
    
    func toggleNegative() {}
    
    func setNumber() {}
    
    func setOperator() {}
    
    func clear() {}
    
    func percent() {}
    
    func updateDisplayValue() {}
    
    // MARK: - Helpers
}
