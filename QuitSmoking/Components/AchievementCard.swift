//
//  AchievementCard.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct AchievementCard: View {
    let achievement: Achievement
    
    var borderGradient = Gradient(
        colors: [
            Color(.achievementCardBorder0),
            Color(.achievementCardBorder31),
            Color(.achievementCardBorder61),
            Color(.achievementCardBorder76),
            Color(.achievementCardBorder100),
        ]
    )
    var cardGradient = Gradient(
        colors: [
            Color(.achievementCard0),
            Color(.achievementCard24),
            Color(.achievementCard58),
            Color(.achievementCard90),
        ]
    )

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                    LinearGradient(
                        gradient: borderGradient,
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 130, height: 170)
            Image(achievement.imageName)
                .resizable()
                .padding(.trailing, 10)
                .padding(.leading, 2)
                .aspectRatio(contentMode: .fill)
            VStack {
                Spacer()
                Text(achievement.title)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity)
                    .padding(.all, 10)
                    .background(
                        LinearGradient(
                            gradient: cardGradient,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
            .background(Color(.clear))
            .cornerRadius(15)
            .frame(width: 130, height: 170)
        }
        .frame(width: 130, height: 170)
    }
       
}
