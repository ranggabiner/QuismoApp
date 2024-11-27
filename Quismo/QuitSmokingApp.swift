//
//  QuitSmokingApp.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 09/08/24.
//

import SwiftUI

@main
struct QuitSmokingApp: App {
    
    init() {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.overrideUserInterfaceStyle = .light
            }
        }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
