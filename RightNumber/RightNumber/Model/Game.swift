//
//  Game.swift
//  RightNumber
//
//  Created by Роман Зобнин on 24.07.2021.
//

import Foundation

protocol GameProtocol {
    var score:Int{ get }
    var currentSecretValue: Int {get}
    var isGameEnded: Bool {get}
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
           return false
        }
    }
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    private func getNewSecretValue() -> Int {
        return Int.random(in: minSecretValue...maxSecretValue)
    }
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        }else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        }else {
            score += 50
        }
    }
}
