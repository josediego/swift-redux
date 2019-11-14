//
//  Settings.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var store: BindableStore<AppState> = nil
}
