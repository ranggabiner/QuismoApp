//
//  BadgeUseCase.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 21/08/24.
//

import Foundation

class BadgeUseCase {
    
    private let userRepository: UserRepository
    private let badgeRepository: BadgeRepository
    private let dashboardUseCase: DashboardUseCase

    init(userRepository: UserRepository, badgeRepository: BadgeRepository) {
        self.userRepository = userRepository
        self.badgeRepository = badgeRepository
        self.dashboardUseCase = DashboardUseCase(repository: userRepository)
    }

    func addBadgesToUser() {
        var user = userRepository.fetch()
        let allCategories = ["health", "money", "time"]
        for category in allCategories {
            let badges = badgeRepository.fetchBadges(for: category)
            user.badges.append(contentsOf: badges)
        }
        userRepository.update(user: user)
    }
    
    func getMoneyBadge() {
        let user = userRepository.fetch()
        let moneySaved = Int(dashboardUseCase.getMoneySaved())
        var moneyBadges = badgeRepository.fetchBadges(for: "money")
        
        for i in 0..<moneyBadges.count {
            print("moneysaved: ", moneySaved)
            print("first", moneyBadges[i])
            if moneySaved >= Int(moneyBadges[i].value) && !moneyBadges[i].isEarned {
                moneyBadges[i].isEarned = true
                userRepository.update(user: user)
            }
        }
    }
    
    func getHeaalthAndTimeBadge() {
        var user = userRepository.fetch()
        let currentDate = Date()
        let onboardDate = user.onBoarding.setDate
        let timeElapsed = currentDate.timeIntervalSince(onboardDate) / 60
        let healthAndTimeBadges = badgeRepository.fetchBadges(for: "time") + badgeRepository.fetchBadges(for: "health")
        
        for badge in healthAndTimeBadges {
            if timeElapsed >= badge.value {
                if let index = user.badges.firstIndex(where: { $0.id == badge.id }) {
                    user.badges[index].isEarned = true
                    userRepository.update(user: user)
                }
            }
        }
    }
}
