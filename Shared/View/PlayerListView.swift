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
    var body: some View {
        NavigationView {
            List{
                ForEach(players) {player in
                    Label(player.name, systemImage: "person")
                }
            }
            .navigationTitle("Player List")
            .toolbar {
                Button(action: {
                    isPresented = true
                }, label: {
                    Text("Edit")
                })
            }
            .sheet(isPresented: $isPresented, content: {
                EditPlayerListView(players: $players)
            })
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView(players: .constant(Player.testPlayerCollection))
    }
}
