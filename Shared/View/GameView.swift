//
//  GameView.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 2/4/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    @State var showingAlert = false
    @State var scoringRound = false
    @State var newPlayer = ""
    @State var scoreingPlayer = ""
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(game.players) { player in
                        HStack {
                            Text(player.name)
                                .padding(5)
                            ForEach(player.score, id: \.self) {score in
                                Text("\(score)")
                            }
                            Text("\(player.getTotal())")
                                .padding(4)
                            Stepper(value: bindingScore(for: player), in: 0...30, step: 1) {
                            }
                        }
                    }.onDelete(perform: deletePlayer)
                }
                if game.currentRound < 2 && !game.players.isEmpty {
                    HStack {
                        Button("Score Round") {
                            game.scoreRound()
                        }
                    }
                }
                if showingAlert {
                    HStack {
                        TextField("New Player", text: $newPlayer)
                        Button(action: {
                            withAnimation {
                                let addedPlayer = Player(name: newPlayer)
                                game.add(player: addedPlayer)
                                newPlayer = ""
                                showingAlert = false
                            }
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                        .buttonStyle(PlainButtonStyle())
                        .disabled(newPlayer.isEmpty)
                    }
                }
            }
            .navigationTitle("Current Round: \(game.currentRound+1)")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAlert = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }

            
        }
    }
    
    func deletePlayer(at offset: IndexSet) {
        game.players.remove(atOffsets: offset)
    }
    
    func bindingScore(for player: Player) -> Binding<Int> {
        guard let index = game.players.firstIndex(of: player) else {
            fatalError()
        }
        return $game.players[index].score[game.currentRound]
    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
            GameView()
                .environmentObject(Game())
    }
}
