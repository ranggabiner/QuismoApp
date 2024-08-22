//
//  DashboardUseCase.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 22/08/24.
//

import Foundation

class DashboardUseCase{
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func getCigaretteAvoided() -> Int {
        let user = repository.fetch()
        
        print("repo")
        print(user)
        // Get the cigarette log and set date
        let cigaretteLog = user.cigaretteLog.cigarettesSmoked
        
        let setDate = user.onBoarding.setDate
        
        let calendar = Calendar.current
        let currentDate = Date()

        // Remove the time component from the current date to get the start of the day
        let startOfToday = calendar.startOfDay(for: currentDate)
        
        // Filter the cigarette log to count dates that are >= setDate and < startOfToday
        let cigarettesSmoked = cigaretteLog.filter { date in
            return date >= setDate && date < startOfToday
        }
        
        // Return the number of cigarettes avoided
        let daysFromStarted = getDaysFromStarted()
        
        return daysFromStarted * user.onBoarding.cigsPerDay - cigarettesSmoked.count 
    }

    
    func getMoneySaved() -> Int{
        let user = repository.fetch()
        
        let cigaretteAvoided = getCigaretteAvoided()
        
        let pricePerPack = user.onBoarding.pricePerPack
        
        let cigsPerPack = user.onBoarding.cigsPerPack
        
        let cigarettePrice = pricePerPack/cigsPerPack
        
        return cigaretteAvoided * cigarettePrice
    }
    
    func getSmokeFree() -> Int{
        let user = repository.fetch()
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        var lastSmokedDay = user.onBoarding.setDate
        
        if(!user.cigaretteLog.cigarettesSmoked.isEmpty){
            lastSmokedDay = user.cigaretteLog.cigarettesSmoked.last!
        }
        
        let components = calendar.dateComponents([.day], from: lastSmokedDay, to: currentDate)
            
        return components.day ?? 0
    }
    
    func getDaysFromStarted() -> Int{
        let user = repository.fetch()
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        let setDate = user.onBoarding.setDate
        
        let components = calendar.dateComponents([.day], from: setDate, to: currentDate)
            
        return components.day ?? 0
    }
}
