//
//  SushiGoCalculatorApp.swift
//  Shared
//
//  Created by Brenton Niebauer on 2/3/21.
//

import SwiftUI

@main
struct SushiGoCalculatorApp: App {
    @ObservedObject private var data = GameData()
    var body: some Scene {
        WindowGroup {
            GameView(game: $data.game)
        }
    }
}
