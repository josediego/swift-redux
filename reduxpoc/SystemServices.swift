//
//  SystemService.swift
//  reduxpoc
//
//  Created by Jose Diego on 11/14/19.
//  Copyright © 2019 Focus in Lab. All rights reserved.
//
import SwiftUI

struct SystemServices: ViewModifier {
    static var store: BindableStore<AppState>
    func body(content: Content) -> some View {
        content
            .environmentObject(Self.store)
    }
}
