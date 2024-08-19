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
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "xmark")
                                .padding()
                                .foregroundColor(.blue)
                        }
                    }
                    AchievementCard(achievement: achievement)
                    
                    ScrollView {
                        Text(achievement.subtitle)
                            .font(.subheadline)
                            .padding()
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
                .frame(width: 250, height: 350)
            }
        }
    }
}
