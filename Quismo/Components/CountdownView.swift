//
//  CountdownView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct CountdownView: View {
    let sessionId: Int
    @ObservedObject var chatController: ChatController
    @State private var timeRemaining: TimeInterval = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(formattedTimeRemaining)
            .foregroundStyle(Color.white)
            .padding(.init(top: 3, leading: 7, bottom: 3, trailing: 7))
            .background(Color.orangeTertiary)
            .onReceive(timer) { _ in
                updateTimeRemaining()
            }
            .onAppear {
                updateTimeRemaining()
            }
    }

    private func updateTimeRemaining() {
        guard let status = chatController.sessionStatuses.first(where: { $0.sessionId == sessionId - 1 }),
              let completionDate = status.completionDate else {
            return
        }
        let sevenDaysLater = Calendar.current.date(byAdding: .day, value: 7, to: completionDate) ?? Date()
        timeRemaining = max(sevenDaysLater.timeIntervalSince(Date()), 0)

        if timeRemaining <= 0 && !chatController.isSessionUnlocked(sessionId) {
            timer.upstream.connect().cancel()
            chatController.unlockNextSession(sessionId)
        }
    }

    private var formattedTimeRemaining: String {
        let days = Int(timeRemaining) / 86400
        let hours = (Int(timeRemaining) % 86400) / 3600
        let minutes = (Int(timeRemaining) % 3600) / 60
        let seconds = Int(timeRemaining) % 60

        if days > 1 {
            return "Open in \(days) days"
        } else if days == 1 {
            return "Open in 1 day"
        } else if hours > 1 {
            return "Open in \(hours) hours"
        } else if hours == 1 {
            return "Open in 1 hour"
        } else if minutes > 1 {
            return "Open in \(minutes) minutes"
        } else if minutes == 1 {
            return "Open in 1 minute"
        } else {
            return "Open in \(seconds) seconds"
        }
    }
}
