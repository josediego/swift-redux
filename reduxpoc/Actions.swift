//
//  Action.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//

import ReSwift

// MARK: - ACTIONS

struct ChooseWeaponAction: Action {
    var weapon: Weapon
}

struct ResetGame: Action {}
