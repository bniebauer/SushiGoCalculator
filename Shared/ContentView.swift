//
//  ContentView.swift
//  Shared
//
//  Created by Brenton Niebauer on 2/3/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: Game = Game()
    var body: some View {
        GameView()
            .environmentObject(game)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
