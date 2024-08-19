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
    var chatBuddy : ChatLogModel
    var chatSessions : [ChatLogModel]
    var badges : [BadgeModel]
    
    init(id: UUID, onBoarding: OnBoardingModel, cigaretteLog: CigaretteLogModel, chatBuddy: ChatLogModel, chatSessions: [ChatLogModel], badges: [BadgeModel]) {
        self.id = id
        self.onBoarding = onBoarding
        self.cigaretteLog = cigaretteLog
        self.chatBuddy = chatBuddy
        self.chatSessions = chatSessions
        self.badges = badges
    }
    
    func toDomain() -> UserModel{
        return .init(
            id: self.id,
            onBoarding: self.onBoarding,
            cigaretteLog: self.cigaretteLog,
            chatBuddy: self.chatBuddy,
            chatSessions: self.chatSessions,
            badges: self.badges
        )
    }
}
