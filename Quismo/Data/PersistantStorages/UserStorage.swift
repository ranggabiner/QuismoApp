//
//  UserStorage.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation
import SwiftData

@Model
class UserStorage {
    var id: UUID
    var onBoarding: OnBoardingModel
    var cigaretteLog : CigaretteLogModel
    var badges : [BadgeModel]
    var message : MessageModel
    var companionChatHistory : CompanionChatHistoryModel
    
    init(id: UUID, onBoarding: OnBoardingModel, cigaretteLog: CigaretteLogModel, badges: [BadgeModel], message : MessageModel, companionChatHistory : CompanionChatHistoryModel) {
        self.id = id
        self.onBoarding = onBoarding
        self.cigaretteLog = cigaretteLog
        self.badges = badges
        self.message = message
        self.companionChatHistory = companionChatHistory
        
    }
    
    func toDomain() -> UserModel{
        return .init(
            id: self.id,
            onBoarding: self.onBoarding,
            cigaretteLog: self.cigaretteLog,
            badges: self.badges,
            message: self.message,
            companionChatHistory: self.companionChatHistory
        )
    }
}
