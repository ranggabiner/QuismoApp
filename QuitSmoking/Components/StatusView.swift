//
//  StatusView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct StatusView: View {
    let status: CardStatus
    let sessionId: Int
    @ObservedObject var chatController: ChatController

    var body: some View {
        Group {
            switch status {
            case .new:
                Circle()
                    .fill(Color.orangeTertiary)
                      .frame(width: 19, height: 19)
            case .onProgress:
                Text("On Progress")
                    .foregroundStyle(Color.white)
                    .padding(.init(top: 3, leading: 7, bottom: 3, trailing: 7))
                    .background(Color.orangeTertiary)
            case .success:
                Image(systemName: "checkmark")
                    .foregroundStyle(Color.bluePrimary)
                    .frame(width: 79, height: 19)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9.5)
                            .stroke(Color.bluePrimary, lineWidth: 2)
                    )
            case .countdown:
                CountdownView(sessionId: sessionId, chatController: chatController)
            }
        }
        .font(.system(size: 12, weight: .medium))
        .clipShape(RoundedRectangle(cornerRadius: 9.5))
    }
}

enum CardStatus {
    case new
    case onProgress
    case success
    case countdown
}
