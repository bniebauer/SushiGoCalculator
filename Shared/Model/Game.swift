//
//  Game.swift
//  SushiGoCalculator
//
//  Created by Brenton Niebauer on 3/5/21.
//

import Foundation

class Game {
    var players: [Player] = []
    var currentRound = 0
    
    func add(player: Player) {
        self.players.append(player)
    }
    
    func remove(_ name: String) {
        guard let index = players.firstIndex(where: {$0.name == name}) else {
            fatalError("Could not find player with name: \(name)")
        }
        self.players.remove(at: index)
    }
    
    func addScore(of score: Int, for name: String) {
        if players.isEmpty {
            return
        }
        guard let index = players.firstIndex(where: {$0.name == name}) else {
            fatalError("Could not locate player")
        }
        
        players[index].scores.insert(score, at: currentRound)
    }
    
    func scoreRound() {
        self.currentRound += 1
    }
    
    func resetScores() {
        self.currentRound = 0
        for index in 0...players.count - 1 {
            self.players[index].scores = [0,0,0]
        }
    }
}

