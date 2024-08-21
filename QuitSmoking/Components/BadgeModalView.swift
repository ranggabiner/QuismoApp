//
//  BadgeModalView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 19/08/24.
//

import SwiftUI

struct BadgeModalView: View {
    let badge: BadgeModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .foregroundColor(Color(.primary))
                    }
                }
                BadgeCardView(badge: badge, cardWidth: 150, cardHeight: 190)
                
                Text(badge.subtitle)
                    .font(.system(size: 15))
                    .padding()
                    .foregroundColor(Color(.primary))
                    .multilineTextAlignment(.center)

            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
            .frame(width: 270, height: 390)
            
        }
    }
}
