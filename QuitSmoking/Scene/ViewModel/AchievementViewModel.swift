//
//  AchievementViewModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation
import Combine

class AchievementViewModel: ObservableObject {
    @Published var healthAchievements: [Achievement] = []
    @Published var moneyAchievements: [Achievement] = []
    @Published var timeAchievements: [Achievement] = []

    private let fetchAchievements: FetchAchievements

    init(fetchAchievements: FetchAchievements) {
        self.fetchAchievements = fetchAchievements
    }

    func loadAchievements() {
        self.healthAchievements = fetchAchievements.execute(for: .health)
        self.moneyAchievements = fetchAchievements.execute(for: .money)
        self.timeAchievements = fetchAchievements.execute(for: .time)
    }
}

