//
//  ContentView.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//

import ReSwift
import SwiftUI

let mainStore = Store<AppState>(
    reducer: appReducer,
    state: nil
)

struct ContentView: View {
    @ObservedObject private var state = ObservableState(store: mainStore)

    var body: some View {
        VStack {
            Text(state.current.message.rawValue)
            HStack {
                Button(action: { self.state.dispatch(ChooseWeaponAction(weapon: .rock)) }) {
                    Text("Rock")
                }
                Button(action: { self.state.dispatch(ChooseWeaponAction(weapon: .paper)) }) {
                    Text("Paper")
                }
                Button(action: { self.state.dispatch(ChooseWeaponAction(weapon: .scissors)) }) {
                    Text("Scissors")
                }
            }
            HStack {
                Text("Player #1: \(state.current.player1Play.weapon?.rawValue ?? "")")
                Text("Player #2: \(state.current.player2Play.weapon?.rawValue ?? "")")
            }
            Button(action: { self.state.dispatch(ResetGame()) }) {
                Text("Reset Game")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
