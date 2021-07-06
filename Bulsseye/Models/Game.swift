//
//  Game.swift
//  Bulsseye (iOS)
//
//  Created by Marconi Gomes on 22/05/21.
//

import Foundation

struct Game {
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 1
    
    init() {
        self.targetValue = self.randomFromZeroToHundred()
    }
        
    func randomFromZeroToHundred() -> Int {
        Int.random(in: 0...100)
    }

    func calculateScore(sliderValue: Int) -> Int {
        100 - abs(sliderValue.distance(to: targetValue))
    }
    
    mutating func resetTargetValue() -> Void {
        self.targetValue = self.randomFromZeroToHundred()
    }
}
