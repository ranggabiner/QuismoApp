//
//  ChatController.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import Foundation
import OpenAI
import SwiftData
import UIKit

class ChatController: ObservableObject {
    @Published var messages: [Message] = []
    @Published var currentSession: Session?
    @Published var userName: String?
    @Published var sessionStatuses: [SessionStatus] = []
    @Published var motivationalQuote: String = ""
    @Published var lastQuoteDate: Date = Date()
    @Published var usedQuotes: Set<String> = []
    @Published var sessionEnded: Bool = false
    @Published var isLoading: Bool = false
    private var chatHistories: [Int: [Message]] = [:]
    
    var modelContext: ModelContext
    private let repository: UserRepository
    
    let openAI = OpenAI(apiToken: "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")

    let sessions = [
        Session(id: 1, initialPrompt: """
        You're a friend helping someone quit smoking. Ask questions step-by-step to gather information according to the following order:

        1. Ask how they feel about quitting smoking and what made them decide to stop now.
        2. Ask if they are ready to quit for good and start now.
        3. Congratulate or reassure them based on their response. If they are unsure, delve deeper into their situation.
        4. Briefly explain the program, including the "not a puff" rule.
        5. Ask for more details about their current smoking habits and past attempts to quit.
        6. Discuss withdrawal symptoms they might experience.
        7. Ask about their plans for support and handling high-risk situations.
        8. Encourage them to write down their commitment as clearly as possible.
        9. Close with a summary, motivation, and Q&A session.

        Use a friendly and informal tone in English. Avoid mentioning CBT explicitly and focus on being a supportive friend.
        You can only answer user questions related to Quit Smoking (CBT), if outside of Quit Smoking (CBT), do not answer.
        Make sure that if it is closed then you have to say "Take Care", "Good Luck", Goodbye"
        """, initialBotMessage: "I'm really glad you're taking this step to quit smoking. How do you feel about quitting smoking, and what made you decide to stop now?"),

        Session(id: 2, initialPrompt: """
        You're a friend helping someone quit smoking. Ask questions step-by-step to gather information according to the following order:

        1. Ask how they've been doing since the last session.
        2. Discuss the situations they've faced, strategies they've tried, and plan new strategies.
        3. Ask about their plans for support and handling high-risk situations this week.
        4. Emphasize the importance of the "not a puff" rule and ask for their commitment for the week.
        5. Close with a summary, motivation, and Q&A session.

        Use a friendly and informal tone in English. Avoid mentioning CBT explicitly and focus on being a supportive friend.
        You can only answer user questions related to Quit Smoking (CBT), if outside of Quit Smoking (CBT), do not answer.
        Make sure that if it is closed then you have to say "Take Care", "Good Luck", Goodbye"
        """, initialBotMessage: "How's it going? Have you managed to stay smoke-free since we last talked?"),

        Session(id: 3, initialPrompt: """
        You're a friend helping someone quit smoking. Ask questions step-by-step to gather information according to the following order:

        1. Ask how they've been doing since the last session.
        2. Discuss the situations they've faced, strategies they've tried, and plan new strategies.
        3. Ask about their plans for support and handling high-risk situations this week.
        4. Emphasize the importance of the "not a puff" rule and ask for their commitment for the week.
        5. Close with a summary, motivation, and Q&A session.

        Use a friendly and informal tone in English. Avoid mentioning CBT explicitly and focus on being a supportive friend.
        You can only answer user questions related to Quit Smoking (CBT), if outside of Quit Smoking (CBT), do not answer.
        Make sure that if it is closed then you have to say "Take Care", "Good Luck", Goodbye"
        """, initialBotMessage: "How have you been since we last talked?"),

        Session(id: 4, initialPrompt: """
        You're a friend helping someone quit smoking. Ask questions step-by-step to gather information according to the following order:

        1. Ask how they've been doing since the last session.
        2. Discuss the situations they've faced, strategies they've tried, and plan new strategies.
        3. Ask about their plans for support and handling high-risk situations this week.
        4. Emphasize the importance of the "not a puff" rule and ask for their commitment for the week.
        5. Ask how they see themselves now without smoking.
        6. Discuss their long-term plans.
        7. Remind them of the "not a puff" rule and assure them it will get easier.
        8. Set expectations for them to remain smoke-free.
        9. Close with a summary, motivation, and Q&A session.

        Use a friendly and informal tone in English. Avoid mentioning CBT explicitly and focus on being a supportive friend.
        You can only answer user questions related to Quit Smoking (CBT), if outside of Quit Smoking (CBT), do not answer.
        Make sure that if it is closed then you have to say "Take Care", "Good Luck", Goodbye"
        """, initialBotMessage: "How's everything going? It's been a week since we last talked. How are you doing?")
    ]

    init(modelContext: ModelContext, repository: UserRepository ) {
        self.repository = repository
        self.modelContext = modelContext
        loadUserName()
        loadSessionStatuses()
        loadUsedQuotesFromUserDefaults()
        startQuoteUpdateTimer()
    }
    
    func generateAndSaveQuote() {
        let prompt = "Generate a short funfact about quitting smoking and living a healthy life. Keep it under 50 characters. Make sure it's unique and different from these quotes: \(usedQuotes.joined(separator: ", "))"
        let query = ChatQuery(
            messages: [.init(role: .system, content: prompt)!],
            model: .gpt4_o_mini
        )
        
        openAI.chats(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                guard let choice = success.choices.first, let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    if !self.usedQuotes.contains(message) {
                        self.motivationalQuote = message
                        self.usedQuotes.insert(message)
                        self.lastQuoteDate = Date()
                        self.saveQuoteToUserDefaults()
                        self.saveUsedQuotesToUserDefaults()
                    } else {
                        self.generateAndSaveQuote()
                    }
                }
            case .failure(let failure):
                print("Failed to generate quote: \(failure)")
            }
        }
    }
    
    private func saveUsedQuotesToUserDefaults() {
        UserDefaults.standard.set(Array(usedQuotes), forKey: "usedQuotes")
    }

    private func loadUsedQuotesFromUserDefaults() {
        if let savedQuotes = UserDefaults.standard.array(forKey: "usedQuotes") as? [String] {
            usedQuotes = Set(savedQuotes)
        }
    }
    
    private func saveQuoteToUserDefaults() {
        UserDefaults.standard.set(motivationalQuote, forKey: "savedQuote")
        UserDefaults.standard.set(lastQuoteDate, forKey: "lastQuoteDate")
    }
    
    func loadQuoteFromUserDefaults() {
        motivationalQuote = UserDefaults.standard.string(forKey: "savedQuote") ?? ""
        lastQuoteDate = UserDefaults.standard.object(forKey: "lastQuoteDate") as? Date ?? Date()
        loadUsedQuotesFromUserDefaults()
    }
    func checkAndUpdateQuote() {
        loadQuoteFromUserDefaults()
        let calendar = Calendar.current
        let now = Date()
        
        // Cek apakah sudah lewat tengah malam sejak quote terakhir
        if let lastDate = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: lastQuoteDate),
           now > calendar.date(byAdding: .day, value: 1, to: lastDate)! || motivationalQuote.isEmpty {
            if usedQuotes.count >= 100 {
                usedQuotes.removeAll()
                saveUsedQuotesToUserDefaults()
            }
            generateAndSaveQuote()
        }
    }
    
    func startQuoteUpdateTimer() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.checkAndUpdateQuote()
        }
    }
    
    private func loadSessionStatuses() {
        let descriptor = FetchDescriptor<SessionStatus>()
        sessionStatuses = (try? modelContext.fetch(descriptor)) ?? []
    }
    
    func markSessionAsAccessed(_ sessionId: Int) {
        if let index = sessionStatuses.firstIndex(where: { $0.sessionId == sessionId }) {
            sessionStatuses[index].hasBeenAccessed = true
        } else {
            let newStatus = SessionStatus(sessionId: sessionId, hasBeenAccessed: true)
            sessionStatuses.append(newStatus)
            modelContext.insert(newStatus)
        }
        try? modelContext.save()
    }

    func hasSessionBeenAccessed(_ sessionId: Int) -> Bool {
        return sessionStatuses.first(where: { $0.sessionId == sessionId })?.hasBeenAccessed ?? false
    }
    
    func markSessionAsCompleted(_ sessionId: Int) {
        if let index = sessionStatuses.firstIndex(where: { $0.sessionId == sessionId }) {
            if sessionStatuses[index].completionDate == nil {
                sessionStatuses[index].isCompleted = true
                sessionStatuses[index].completionDate = Date()
                
                if sessionId < sessions.count {
                    let nextSessionId = sessionId + 1
                    if let nextIndex = sessionStatuses.firstIndex(where: { $0.sessionId == nextSessionId }) {
                        sessionStatuses[nextIndex].isLocked = false
                    } else {
                        let newStatus = SessionStatus(sessionId: nextSessionId, isLocked: false)
                        sessionStatuses.append(newStatus)
                        modelContext.insert(newStatus)
                    }
                }
                
                try? modelContext.save()
            }
        } else {
            let newStatus = SessionStatus(sessionId: sessionId, isCompleted: true, isLocked: false, completionDate: Date())
            sessionStatuses.append(newStatus)
            modelContext.insert(newStatus)
            try? modelContext.save()
        }
    }
    
    func unlockNextSession(_ sessionId: Int) {
        if sessionId <= sessions.count {
            if let index = sessionStatuses.firstIndex(where: { $0.sessionId == sessionId }) {
                sessionStatuses[index].isUnlocked = true
            } else {
                let newStatus = SessionStatus(sessionId: sessionId, isLocked: false, isUnlocked: true)
                sessionStatuses.append(newStatus)
                modelContext.insert(newStatus)
            }
            try? modelContext.save()
            objectWillChange.send()
        }
    }
    
    func isSessionUnlocked(_ sessionId: Int) -> Bool {
        return sessionStatuses.first(where: { $0.sessionId == sessionId })?.isUnlocked ?? false
    }
    
    func isCountdownFinished(_ sessionId: Int) -> Bool {
        guard let status = sessionStatuses.first(where: { $0.sessionId == sessionId - 1 }),
              let completionDate = status.completionDate else {
            return false
        }
        let sevenDaysLater = Calendar.current.date(byAdding: .day, value: 7, to: completionDate) ?? Date()
        return Date() >= sevenDaysLater
    }
    
    func isSessionCompleted(_ sessionId: Int) -> Bool {
        return sessionStatuses.first(where: { $0.sessionId == sessionId })?.isCompleted ?? false
    }
    
    func isSessionLocked(_ sessionId: Int) -> Bool {
        return sessionStatuses.first(where: { $0.sessionId == sessionId })?.isLocked ?? false
    }
    
    func sessionHasMessages(_ sessionId: Int) -> Bool {
        let descriptor = FetchDescriptor<ChatHistory>(predicate: #Predicate { $0.sessionId == sessionId })
        if let chatHistory = try? modelContext.fetch(descriptor).first {
            return chatHistory.messages.contains(where: { $0.isUser })
        }
        return false
    }
    
    func checkSessionCompletion() {
        guard let currentSession = currentSession, let lastMessage = messages.last, !lastMessage.isUser else {
            return
        }
        
        let keywords = ["goodbye", "take care", "good luck"]
        if keywords.contains(where: lastMessage.content.lowercased().contains) {
            markSessionAsCompleted(currentSession.id)
            sessionEnded = true
            let location = getTitle(for: currentSession.id)
            let botLeftMessage = Message(content: "Poppy has left the \(location)", isUser: false)
            self.messages.append(botLeftMessage)
            saveChatHistory()
        }
    }
    
    func loadUserName() {
        let user = repository.fetch()
        self.userName = user.onBoarding.name
    }

    func switchSession(to sessionId: Int) {
        guard let session = sessions.first(where: { $0.id == sessionId }) else { return }
        self.currentSession = session
        
        let descriptor = FetchDescriptor<ChatHistory>(predicate: #Predicate { $0.sessionId == sessionId })
        if let chatHistory = try? modelContext.fetch(descriptor).first {
            self.messages = chatHistory.messages
        } else {
            var initialMessage = session.initialBotMessage
            if let userName = userName {
                initialMessage = "Hey, \(userName)! " + initialMessage
            }
            self.messages = [Message(content: initialMessage, isUser: false)]
            
        }
        markSessionAsAccessed(sessionId)
        saveChatHistory()
    }
    
    func updateUserName(_ name: String) {
        self.userName = name
        var user = repository.fetch()
        user.onBoarding.name = name
        repository.update(user: user)
    }

    func sendNewMessage(content: String) {
        guard let sessionId = currentSession?.id, !isSessionLocked(sessionId) else { return }

        let userMessage = Message(content: content, isUser: true)
        self.messages.append(userMessage)
        saveChatHistory()
        
        // Tambahkan pesan "Loading..." segera setelah pesan pengguna
        let loadingMessage = Message(content: "Loading...", isUser: false)
        self.messages.append(loadingMessage)
        
        isLoading = true
        
        getBotReply()
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    private func saveChatHistory() {
        guard let sessionId = currentSession?.id else { return }
        
        let descriptor = FetchDescriptor<ChatHistory>(predicate: #Predicate { $0.sessionId == sessionId })
        if let existingHistory = try? modelContext.fetch(descriptor).first {
            existingHistory.messages = self.messages
        } else {
            let newHistory = ChatHistory(sessionId: sessionId, messages: self.messages)
            modelContext.insert(newHistory)
        }
        
        try? modelContext.save()
    }
    
  
    func getBotReply() {
        guard let session = currentSession else { return }
        
        var combinedMessages = [Message(content: session.initialPrompt, isUser: false)] + self.messages.dropLast() // Abaikan pesan "Loading..."
        
        if let userName = userName {
            combinedMessages.insert(Message(content: "Nama pengguna adalah \(userName).", isUser: false), at: 1)
        }
        
        let query = ChatQuery(
            messages: combinedMessages.map({ .init(role: $0.isUser ? .user : .system, content: $0.content)! }),
            model: .gpt4_o_mini
        )
        
        openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else { return }
                guard let message = choice.message.content?.string else { return }
                
                DispatchQueue.main.async {
                    // Hapus pesan "Loading..."
                    self.messages.removeLast()
                    
                    let botMessage = Message(content: message, isUser: false)
                    self.messages.append(botMessage)
                    self.saveChatHistory()
                    self.isLoading = false
                    
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    SoundManager.shared.playSound()
                    
                    if let sessionId = self.currentSession?.id {
                        self.chatHistories[sessionId] = self.messages
                    }
                }
            case .failure(let failure):
                print(failure)
                DispatchQueue.main.async {
                    // Hapus pesan "Loading..." jika terjadi kesalahan
                    self.messages.removeLast()
                    self.isLoading = false
                }
            }
        }
    }
    
    func getTitle(for sessionId: Int) -> String {
        switch sessionId {
        case 1: return "Coffee Shop"
        case 2: return "Mall"
        case 3: return "Playground"
        case 4: return "Park"
        default: return "Let's talk"
        }
    }
}


@Model
class ChatHistory {
    var sessionId: Int
    var messages: [Message]
    
    init(sessionId: Int, messages: [Message]) {
        self.sessionId = sessionId
        self.messages = messages
    }
}

@Model
class Message {
    var id: UUID
    var content: String
    var isUser: Bool
    var timestamp: Date
    
    init(id: UUID = UUID(), content: String, isUser: Bool, timestamp: Date = Date()) {
        self.id = id
        self.content = content
        self.isUser = isUser
        self.timestamp = timestamp
    }
}

@Model
class SessionStatus {
    var sessionId: Int
    var isCompleted: Bool
    var isLocked: Bool
    var hasBeenAccessed: Bool
    var completionDate: Date?
    var isUnlocked: Bool

    init(sessionId: Int, isCompleted: Bool = false, isLocked: Bool = false, hasBeenAccessed: Bool = false, isUnlocked: Bool = false, completionDate: Date? = nil) {
        self.sessionId = sessionId
        self.isCompleted = isCompleted
        self.isLocked = isLocked
        self.hasBeenAccessed = hasBeenAccessed
        self.isUnlocked = isUnlocked
        self.completionDate = completionDate
    }
}


struct Session {
    var id: Int
    var initialPrompt: String
    var initialBotMessage: String
}
