//
//  AchievementCategory.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import Foundation

struct AchievementCategory: Codable {
    let health: [Achievement]
    let money: [Achievement]
    let time: [Achievement]
}
