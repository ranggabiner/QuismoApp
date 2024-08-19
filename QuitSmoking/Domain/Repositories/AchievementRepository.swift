//
//  AchievementRepository.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation

enum AchievementCategory {
    case health
    case money
    case time
}

protocol AchievementRepository {
    func fetchAchievements(for category: AchievementCategory) -> [Achievement]
}

class AchievementRepositories: AchievementRepository {
    func fetchAchievements(for category: AchievementCategory) -> [Achievement] {
        switch category {
        case .health:
            return [
                Achievement(id: UUID(), title: "20 Minutes", subtitle: "Heart rate and blood pressure drop to healthier levels.", imageName: "health1"),
                Achievement(id: UUID(), title: "12 Hours", subtitle: "Carbon monoxide levels in the blood return to normal.", imageName: "health1"),
                Achievement(id: UUID(), title: "2 Weeks", subtitle: "Circulation improves and lung function begins to enhance.", imageName: "health1")
            ]
        case .money:
            return [
                Achievement(id: UUID(), title: "Save $50", subtitle: "Can buy a basic lunch at a local café.", imageName: "money1"),
                Achievement(id: UUID(), title: "Save $100", subtitle: "Enough for a stylish wallet.", imageName: "money1"),
                Achievement(id: UUID(), title: "Save $200", subtitle: "Can purchase a high-quality pair of wireless earbuds.", imageName: "money1")
            ]
        case .time:
            return [
                Achievement(id: UUID(), title: "10 Seconds", subtitle: "The fastest 100-meter sprint by Usain Bolt, who completed it in 9.58 seconds.", imageName: "time1"),
                Achievement(id: UUID(), title: "5 Minutes", subtitle: "The longest time a person has held their breath underwater on pure oxygen, achieved by Stig Severinsen in 5 minutes and 32 seconds.", imageName: "time1"),
                Achievement(id: UUID(), title: "26 Minutes", subtitle: "The time it took for the fastest human to complete a 10-kilometer run, achieved by Joshua Cheptegei in 26 minutes and 38 seconds.", imageName: "time1")
            ]
        }
    }
}
