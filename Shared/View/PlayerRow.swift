//
//  PlayerRow.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 3/2/21.
//

import SwiftUI

struct PlayerRow: View {
    @EnvironmentObject var game: Game
    @Binding var player: Player
    var body: some View {
       Text("")
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var testPlayer = Player(name: "Tony")
    static var previews: some View {
        PlayerRow(player: .constant(testPlayer))
            .environmentObject(Game())
    }
}
