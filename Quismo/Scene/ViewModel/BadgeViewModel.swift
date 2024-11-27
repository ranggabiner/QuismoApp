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
    private let badgeUseCase: BadgeUseCase
    private var timer: AnyCancellable?

    init(badgeRepository: BadgeRepository, badgeUseCase: BadgeUseCase) {
        self.badgeRepository = badgeRepository
        self.badgeUseCase = badgeUseCase
        self.startBadgeTimer()
    }

    func loadBadges() {
        self.healthBadges = badgeRepository.fetchBadges(for: "health")
        self.moneyBadges = badgeRepository.fetchBadges(for: "money")
        self.timeBadges = badgeRepository.fetchBadges(for: "time")
        self.addBadgesToUser()
    }

    func addBadgesToUser() {
        badgeUseCase.addBadgesToUser()
    }
    
    func getBadge() {
        badgeUseCase.getMoneyBadge()
        badgeUseCase.getHeaalthAndTimeBadge()
    }

    private func startBadgeTimer() {
        timer = Timer.publish(every: 60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.getBadge()
                self?.loadBadges()
            }
    }

    deinit {
        timer?.cancel()
    }
}

