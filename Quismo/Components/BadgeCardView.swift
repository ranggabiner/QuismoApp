//
//  BadgeCardView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct BadgeCardView: View {
    let badge: BadgeModel
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
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
                    lineWidth: 4
                )
                .frame(width: cardWidth, height: cardHeight)
            Image(badge.imageName)
                .resizable()
                .padding(.trailing, 10)
                .padding(.leading, 2)
                .aspectRatio(contentMode: .fill)
            VStack {
                Spacer()
                Text(badge.title)
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
            .frame(width: cardWidth, height: cardHeight)
            
            if !badge.isEarned {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: cardWidth, height: cardHeight)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
        }
        .frame(width: cardWidth, height: cardHeight)
        .background(Color(.yellowTint3))
        .cornerRadius(15)

    }
       
}
