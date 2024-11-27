//
//  ChatBuddyUseCase.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import OpenAI
import Foundation
import UIKit

class ChatBuddyUseCase: ObservableObject {
    @Published var companionMessages: [MessageModel] = []
    @Published var userName: String?
    @Published var isLoading: Bool = false

    private let repository: UserRepository
    private let openAI: OpenAI
    private let poppy: [String: String]

    init(repository: UserRepository) {
        self.repository = repository
        self.openAI = OpenAI(apiToken: "api-key")
        
        self.poppy = [
            "initialPrompt": """
            You are Poppy, a friendly AI companion helping the user quit smoking. Your responses should be supportive, encouraging, and tailored to the user's journey to quit smoking. Use casual, conversational language to make the user feel comfortable and at ease. Avoid formal or clinical tones, and instead opt for a friendly, approachable style as if chatting with a supportive friend.

            Generate a friendly, welcoming initial message to greet the user. The message should be encouraging and express your readiness to help them quit smoking.
            """
        ]

        loadUserName()
        loadCompanionChatHistory()
    }

    func loadUserName() {
        let user = repository.fetch()
        self.userName = user.onBoarding.name
    }

     func loadCompanionChatHistory() {
        let user = repository.fetch()
        self.companionMessages = user.companionChatHistory.companionMessages
        if self.companionMessages.isEmpty {
            generateInitialCompanionMessage()
        }
    }

    private func saveCompanionChatHistory() {
        var user = repository.fetch()
        user.companionChatHistory.companionMessages = self.companionMessages
        repository.update(user: user)
    }

    private func generateInitialCompanionMessage() {
        let query = ChatQuery(
            messages: [.init(role: .system, content: poppy["initialPrompt"])!],
            model: .gpt4_o_mini
        )

        openAI.chats(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                guard let choice = success.choices.first,
                      let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    let initialMessage = MessageModel(content: message, isUser: false)
                    self.companionMessages = [initialMessage]
                    self.saveCompanionChatHistory()
                }
            case .failure(let failure):
                print("Failed to generate initial message: \(failure)")
                let defaultMessage = MessageModel(content: "Hi there! I'm Poppy, your AI buddy to help you quit smoking. How can I assist you today?", isUser: false)
                self.companionMessages = [defaultMessage]
                self.saveCompanionChatHistory()
            }
        }
    }

    func sendCompanionNewMessage(content: String) {
        let userMessage = MessageModel(content: content, isUser: true)
        self.companionMessages.append(userMessage)
        saveCompanionChatHistory()

        let loadingMessage = MessageModel(content: "Loading...", isUser: false)
        self.companionMessages.append(loadingMessage)
        isLoading = true
        getCompanionReply()
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    private func getCompanionReply() {
        let prompt = poppy["initialPrompt"]!
        var combinedMessages = [MessageModel(content: prompt, isUser: false)] + self.companionMessages.dropLast()

        if let userName = userName {
            combinedMessages.insert(MessageModel(content: "Nama pengguna adalah \(userName).", isUser: false), at: 1)
        }

        let query = ChatQuery(
            messages: combinedMessages.map({ .init(role: $0.isUser ? .user : .system, content: $0.content)! }),
            model: .gpt4_o_mini
        )

        openAI.chats(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                guard let choice = success.choices.first,
                      let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    self.companionMessages.removeLast()
                    let botMessage = MessageModel(content: message, isUser: false)
                    self.companionMessages.append(botMessage)
                    self.saveCompanionChatHistory()
                    self.isLoading = false
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    SoundManager.shared.playSound()
                }
            case .failure(let failure):
                print(failure)
                DispatchQueue.main.async {
                    self.companionMessages.removeLast()
                    self.isLoading = false
                }
            }
        }
    }

    func updateUserName(_ name: String) {
        self.userName = name
        var user = repository.fetch()
        user.onBoarding.name = name
        repository.update(user: user)
    }
}
