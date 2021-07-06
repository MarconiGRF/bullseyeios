//
//  BulsseyeTests.swift
//  BulsseyeTests
//
//  Created by Marconi Gomes on 05/07/21.
//

import XCTest
@testable import Bulsseye

class BulsseyeTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testInitialValues() throws {
        XCTAssertNotNil(game.score)
        XCTAssertNotNil(game.targetValue)
        XCTAssertNotNil(game.round)
        
        XCTAssertEqual(game.round, 1)
    }
    
    func testScore() throws {
        let userGuess = game.targetValue - 5
        let score = game.calculateScore(sliderValue: userGuess)
        XCTAssertEqual(score, 95)
    }
    
    func testResetTarget() throws {
        let initialValue = game.targetValue
        game.resetTargetValue()
        let resettedValue = game.targetValue
        
        XCTAssertNotEqual(initialValue, resettedValue)
    }
    
}
