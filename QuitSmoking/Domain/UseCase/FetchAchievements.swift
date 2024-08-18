//
//  FetchAchievements.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation

class FetchAchievements {
    private let repository: AchievementRepository

    init(repository: AchievementRepository) {
        self.repository = repository
    }

    func execute(for category: AchievementCategory) -> [Achievement] {
        return repository.fetchAchievements(for: category)
    }
}
