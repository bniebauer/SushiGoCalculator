//
//  Game.swift
//  SushiGoCalculator
//
//  Created by Brenton Niebauer on 3/5/21.
//

import Foundation

class Game: ObservableObject {
    @Published var players = [Player]()
    @Published var currentRound = 0
    
    func add(player: Player) {
        self.players.append(player)
    }
    
    func remove(at offset: IndexSet) {
        self.players.remove(atOffsets: offset)
    }
    
    func remove(player: Player) {
        if let playerIndex = players.firstIndex(of: player) {
            self.players.remove(at: playerIndex)
        }
    }
    
    func scoreRound() {
        self.currentRound += 1
    }
    
    func resetScores() {
        
    }
}
