//
//  LetsTalkListView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI


struct LetsTalkListView: View {
    @ObservedObject var chatController: ChatController
    @State private var selectedSession: IdentifiableSession?
    @Environment(\.presentationMode) var presentationMode

    struct IdentifiableSession: Identifiable {
        let id: Int
    }

    var body: some View {
        ScrollView {            
            VStack(spacing: 13) {
                ForEach(chatController.sessions, id: \.id) { session in
                    LetsTalkCard(
                        title: "\(session.id). \(chatController.getTitle(for: session.id))",
                        subtitle: getSubtitle(for: session.id),
                        imageName: "dog\(session.id)",
                        status: getCardStatus(for: session.id),
                        action: {
                            if isSessionAvailable(session.id) {
                                selectedSession = IdentifiableSession(id: session.id)
                            }
                        },
                        isDisabled: !isSessionAvailable(session.id),
                        sessionId: session.id,
                        chatController: chatController
                    )
                }
            }
            .padding(.vertical)
        }
//        .navigationTitle("Let's Talk!")
        .fullScreenCover(item: $selectedSession) { session in
            ChatSessionView(
                chatController: chatController,
                sessionId: session.id
            )
            .navigationBarBackButtonHidden()
        }
    }


    private func getSubtitle(for sessionId: Int) -> String {
        switch sessionId {
        case 1: return "Let's have a casual chat!"
        case 2: return "Let's go for a walk and chat!"
        case 3: return "Let's hang out together!"
        case 4: return "Let's go for a walk and chat!"
        default: return "Let's talk!"
        }
    }
        
    private func getCardStatus(for sessionId: Int) -> CardStatus? {
        if chatController.isSessionCompleted(sessionId) {
            return .success
        } else if chatController.isSessionLocked(sessionId) {
            return nil
        } else if !isSessionAvailable(sessionId) {
            if shouldShowCountdown(sessionId) {
                return .countdown
            } else {
                return nil
            }
        } else {
            if !chatController.sessionHasMessages(sessionId) {
                return .new
            } else {
                return .onProgress
            }
        }
    }
    
    private func isSessionAvailable(_ sessionId: Int) -> Bool {
        if sessionId == 1 {
            return true
        }
        return chatController.isSessionUnlocked(sessionId)
    }

    private func shouldShowCountdown(_ sessionId: Int) -> Bool {
        guard let previousSessionStatus = chatController.sessionStatuses.first(where: { $0.sessionId == sessionId - 1 }) else {
            return false
        }
        return previousSessionStatus.isCompleted && previousSessionStatus.completionDate != nil
    }
}
