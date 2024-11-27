//
//  LetsTalkCard.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct LetsTalkCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    let status: CardStatus?
    let action: () -> Void
    let isDisabled: Bool
    let sessionId: Int
    @ObservedObject var chatController: ChatController

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: action) {
                ZStack {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundStyle(isDisabled ? Color.white.opacity(0.6) : Color.bluePrimary)
                            .frame(width: .infinity, height: 101)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.horizontal, 20)
                        
                        if isDisabled {
                            Rectangle()
                                .foregroundStyle(Color.bluePrimary)
                                .frame(width: .infinity, height: 101)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal, 20)
                        }
                        
                        HStack(alignment: .top, spacing: 11) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 79, height: 79)
                                    .overlay(
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFill()
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 9))
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(title)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(Color.white)
                                Text(subtitle)
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(Color.blueTint3)
                            }
                            .padding(.top, 5)
                        }
                        .padding(.leading, 31)
                    }
                    if isDisabled {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.blueShade3)
                            .font(.system(size: 36, weight: .semibold))
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(isDisabled)

            if let status = status {
                StatusView(status: status, sessionId: sessionId, chatController: chatController)
                    .padding(.top, -10)
                    .padding(.trailing, 20)
            }

        }
    }
}
