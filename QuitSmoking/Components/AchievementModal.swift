//
//  AchievementModal.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 19/08/24.
//

import SwiftUI

struct AchievementModal: View {
    let achievement: Achievement
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .padding()
                    }
                }
                VStack {
                    AchievementCard(achievement: achievement)
                    Text(achievement.subtitle)
                        .font(.subheadline)
                        .padding()
                }
            }
            .frame(width: 250, height: 300)
            .background(Color(.white))
            .cornerRadius(15)
        }
    }
}

