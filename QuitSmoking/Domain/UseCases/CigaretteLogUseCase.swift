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
        
        var user = UserModel(
            id: UUID(),
            onBoarding: OnBoardingModel(),
            cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
            chatBuddy: ChatLogModel(messages: []),
            chatSessions: [],
            badges: [])
        
        repository.insert(user: user)
    }
    
    func addSmoke(){
        var user = repository.fetch()
        user.cigaretteLog.cigarettesSmoked.append(Date())
        repository.update(user: user)
        print(user.cigaretteLog.cigarettesSmoked.count)
    }
    
    func fetch() -> CigaretteLogModel{
        let user = repository.fetch()
        return user.cigaretteLog
    }
}
