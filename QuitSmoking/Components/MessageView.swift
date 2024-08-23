//
//  MessageView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var isFirstMessage: Bool

    var body: some View {
        if message.content.starts(with: "Poppy has left") {
            Text(message.content)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.blueTint3)
                .padding()
                .frame(maxWidth: .infinity)
        } else {
            VStack {
                if message.isUser {
                    HStack {
                        Spacer()
                        ZStack(alignment: .bottomTrailing) {
                            Text(message.content)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color.yellowTint3)
                                .foregroundColor(Color.blueShade3)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                            
                            Circle()
                                .fill(Color.yellowSecondary)
                                .frame(width: 20, height: 20)
                                .offset(x: 0, y: 10)
                        }
                    }
                } else {
                    HStack {
                        ZStack(alignment: .bottomLeading) {
                            Text(message.content)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color.white)
                                .foregroundColor(Color.blueShade3)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                                .padding(.top, isFirstMessage ? 20 : 0)
                            
                            Circle()
                                .fill(Color.yellowSecondary)
                                .frame(width: 20, height: 20)
                                .offset(x: 0, y: 10)
                        }
                        Spacer()
                    }
                }
            }
            .font(.system(size: 14, weight: .medium))
        }
    }
}
