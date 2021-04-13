//
//  EditPlayerListView.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 2/3/21.
//

import SwiftUI

struct EditPlayerListView: View {
    @Binding var players: [Player]
    @State private var newPlayer = ""
    var body: some View {
        List{
            ForEach(players) {player in
                Text(player.name)
            }
            .onDelete { indices in
                players.remove(atOffsets: indices)
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

struct EditPlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerListView(players: .constant(Player.testPlayerCollection))
    }
}
