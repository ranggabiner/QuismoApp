//
//  UserModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

struct UserModel : Identifiable, Codable{
    var id: UUID
    var onBoarding: OnBoardingModel
    var cigaretteLog : CigaretteLogModel
    var chatBuddy : ChatLogModel
    var chatSessions : [ChatLogModel]
    var badges : [BadgeModel]
}
