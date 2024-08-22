//
//  BadgeRepository.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation

protocol BadgeRepository {
    func fetchBadges(for category: String) -> [BadgeModel]
}

class BadgeRepositories: BadgeRepository {
    private var badges: [BadgeModel] = []

    init() {
        loadBadges()
    }

    private func loadBadges() {
        guard let url = Bundle.main.url(forResource: "badgesData", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            badges = try decoder.decode([BadgeModel].self, from: data)
        } catch {
            print("Error loading or decoding JSON: \(error)")
        }
    }

    func fetchBadges(for category: String) -> [BadgeModel] {
        return badges.filter { $0.category == category }
    }
}
