//
//  PlayerRow.swift
//  SushiGoCalculator (iOS)
//
//  Created by Brenton Niebauer on 3/2/21.
//

import SwiftUI

struct PlayerRow: View {
    @Binding var player: Player
    @Binding var round: Int
    @State var score = 0
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Label("\(player.name)", systemImage: "person")
                    .padding(.trailing)
                ForEach(player.scores, id: \.self) { score in
                    Text("\(score)")
                }
                Spacer()
                if round < 4 {
                    Button(action: {
                        increase()
                    }, label: {
                        Image(systemName: "plus")
                    })
                        .padding(.trailing)
                        .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        decrease()
                    }, label: {
                        Image(systemName: "minus")
                    })
                        .padding(.trailing)
                        .buttonStyle(PlainButtonStyle())
                } else {
                    Text("\(player.total)")
                }
            }
        }
    }
    
    private func increase() {
        print("Increase pressed")
        var currentScore = player.scores[round-1]
        if currentScore == 35 {
            return
        }
        currentScore += 1
        player.scores[round-1] = currentScore
        
    }
    
    private func decrease() {
        print("Decrease pressed")
        var currentScore = player.scores[round-1]
        if currentScore == 0 {
            return
        }
        currentScore -= 1
        player.scores[round-1] = currentScore
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var testPlayer = Player(name: "Brenton")
    static var previews: some View {
        List {
            PlayerRow(player: .constant(testPlayer), round: .constant(1))
        }
    }
}
