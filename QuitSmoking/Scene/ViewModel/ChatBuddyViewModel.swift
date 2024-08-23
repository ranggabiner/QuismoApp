//
//  ChatBuddyViewModel.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI
import Combine

class ChatBuddyViewModel: ObservableObject {
    @Published var companionMessages: [MessageModel] = []
    @Published var inputText: String = ""
    @Published var isLoading: Bool = false
    @Published var userName: String?

    private let chatUseCase: ChatBuddyUseCase
    private var cancellables = Set<AnyCancellable>()

    init(chatUseCase: ChatBuddyUseCase) {
        self.chatUseCase = chatUseCase
        setupBindings()
    }

    private func setupBindings() {
        chatUseCase.$companionMessages
            .assign(to: \.companionMessages, on: self)
            .store(in: &cancellables)

        chatUseCase.$isLoading
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellables)

        chatUseCase.$userName
            .assign(to: \.userName, on: self)
            .store(in: &cancellables)
    }

    func sendMessage() {
        guard !inputText.isEmpty else { return }
        chatUseCase.sendCompanionNewMessage(content: inputText)
        inputText = ""
    }

    func loadInitialData() {
        chatUseCase.loadUserName()
        chatUseCase.loadCompanionChatHistory()
    }
}
