//
//  CigaretteLogUseCase.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

class CigaretteLogUseCase{
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
        
        var formattedDateThreeDaysAgo: Date {
            let calendar = Calendar.current
            let now = Date()
            return calendar.date(byAdding: .day, value: -3, to: now) ?? now
        }
        
        
        var user = UserModel(
            id: UUID(),
            onBoarding: OnBoardingModel(),
            cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
            chatBuddy: ChatLogModel(messages: []),
            chatSessions: [],
            badges: [])
        
        user.onBoarding.setDate = formattedDateThreeDaysAgo
        
        repository.insert(user: user)
    }
    
    func addSmoke(){
        var user = repository.fetch()
        user.cigaretteLog.cigarettesSmoked.append(Date())
        repository.update(user: user)
        print(user.cigaretteLog.cigarettesSmoked.count)
    }
    
    func fetchCigaretteLog() -> CigaretteLogModel{
        let user = repository.fetch()
        return user.cigaretteLog
    }
    
    func fetchSetDate() -> Date{
        let user = repository.fetch()
        return user.onBoarding.setDate
    }
}
