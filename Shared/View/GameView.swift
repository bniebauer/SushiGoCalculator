//
//  GameView.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 2/4/21.
//

import SwiftUI

struct GameView: View {
    @Binding var game: Game
    @State private var currentRound = 1
    @State var isShowing = false
    @State var scoring = false
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(game.players) { player in
                        PlayerRow(player: binding(for: player), round: $currentRound)
                    }
                    .onDelete(perform: deletePlayer)
                }
                if currentRound <= 3 && !game.players.isEmpty {
                    HStack {
                        Button("Score Round") {
                            game.currentRound = currentRound
                            currentRound += 1
                        }
                    }
                }
            }
            .navigationTitle("Current Round: \(currentRound < 4 ? String(currentRound) : "Final")")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowing = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                        .padding()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Reset Game") {
                        game.resetScores()
                        currentRound = game.currentRound + 1
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowing) {
                NavigationView {
                    PlayerListView(players: $game.players)
                        .navigationTitle("Players")
                        .navigationBarItems(leading: Button("Cancel"){
                            isShowing = false
                        }, trailing: Button("Done"){
                            isShowing = false
                        })
                }
            }
        }
    }
    
    func deletePlayer(at offset: IndexSet) {
        game.players.remove(atOffsets: offset)
    }
    
    func binding(for player: Player) -> Binding<Player> {
        guard let index = game.players.firstIndex(where: {$0.id == player.id }) else {
            fatalError()
        }
        return $game.players[index]
    }

}

struct GameView_Previews: PreviewProvider {
    static var game = Game()
    static var previews: some View {
        GameView(game: .constant(game))
    }
}
