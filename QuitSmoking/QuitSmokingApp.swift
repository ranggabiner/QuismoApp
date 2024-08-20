//
//  QuitSmokingApp.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 09/08/24.
//

import SwiftUI

@main
struct QuitSmokingApp: App {
    var body: some Scene {
        WindowGroup {
            @State var step = 1
            GreetingsViewView()
        }
    }
}
