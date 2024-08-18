//
//  AchievementCardView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct AchievementCardView: View {
    let achievement: Achievement

    var body: some View {
        VStack(spacing: 5) {
            Image(achievement.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 80)
            Text(achievement.title)
                .font(.headline)
            
            Text(achievement.subtitle)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: 50)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
        .frame(width: 150, height: 210)
    }
}
