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
    var score: [Int] = [0,0,0]
    
    func getTotal() -> Int {
        return self.score.reduce(0, +)
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
