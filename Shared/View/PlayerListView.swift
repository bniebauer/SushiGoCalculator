//
//  PlayerListView.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 2/3/21.
//

import SwiftUI

struct PlayerListView: View {
    @Binding var players: [Player]
    @State private var isPresented = false
    @State private var newPlayer = ""
    var body: some View {
        List{
            ForEach(players) {player in
                Label(player.name, systemImage: "person")
            }
            HStack {
                TextField("New Player", text: $newPlayer)
                Button(action: {
                    withAnimation {
                        let addedPlayer = Player(name: newPlayer)
                        players.append(addedPlayer)
                        newPlayer = ""
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                .buttonStyle(PlainButtonStyle())
                .disabled(newPlayer.isEmpty)
            }
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView(players: .constant(Player.testPlayerCollection))
    }
}
