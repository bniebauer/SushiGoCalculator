//
//  Player.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 2/3/21.
//

import Foundation

struct Player : Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
    var scores: [Int] = [0,0,0]
    
    var total: Int {
        return self.scores.reduce(0, +)
    }
    
    mutating func resetScores() {
        self.scores = [0,0,0]
    }
}

extension Player {
    static var testPlayer = Player(name: "Tony")
    static var testPlayerCollection: [Player] = [
        Player(name: "Tony"),
        Player(name: "Steve"),
        Player(name: "Thor"),
        Player(name: "Bruce")
    ]
}
