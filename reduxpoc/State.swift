//
//  State.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//

import ReSwift

// MARK: - STATE

struct AppState: StateType {
    var message: Message
    var turn: Turn
    var player1Play: Play
    var player2Play: Play
    var result: Result?

    init() {
        message = .player1choose
        turn = Turn(player: .one)
        player1Play = Play(chosen: false, weapon: nil)
        player2Play = Play(chosen: false, weapon: nil)
    }
}

// MARK: - MODEL & OPTIONS

enum Message: String {
    case player1choose = "PLAYER 1 - Choose your weapon:"
    case player2choose = "PLAYER 2 - Choose your weapon:"
    case player1wins = "PLAYER 1 WINS!"
    case player2wins = "PLAYER 2 WINS!"
    case draw = "DRAW!"
}

struct Turn {
    var player: Player
}

enum Player {
    case one
    case two
}

struct Play {
    var chosen: Bool
    var weapon: Weapon?
}

enum Weapon: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

enum Result {
    case draw
    case player1wins
    case player2wins
}
