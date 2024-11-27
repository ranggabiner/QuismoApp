//
//  MessageModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

struct BadgeModel: Identifiable, Codable {
    var id: Int
    var title: String
    var value: Double
    var subtitle: String
    var imageName: String
    var isEarned: Bool
    var category: String
}
