//
//  BadgeViewModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation
import Combine

class BadgeViewModel: ObservableObject {
    @Published var healthBadges: [BadgeModel] = []
    @Published var moneyBadges: [BadgeModel] = []
    @Published var timeBadges: [BadgeModel] = []

    private let badgeRepository: BadgeRepository

    init(badgeRepository: BadgeRepository) {
        self.badgeRepository = badgeRepository
        loadBadges()
    }

    func loadBadges() {
        self.healthBadges = badgeRepository.fetchBadges(for: "health")
        self.moneyBadges = badgeRepository.fetchBadges(for: "money")
        self.timeBadges = badgeRepository.fetchBadges(for: "time")
    }
}
