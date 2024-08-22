//
//  MessageModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

struct MessageModel: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var content: String = ""
    var isUser: Bool = false
    var timestamp: Date = Date()
    
    static func == (lhs: MessageModel, rhs: MessageModel) -> Bool {
        return lhs.id == rhs.id &&
               lhs.content == rhs.content &&
               lhs.isUser == rhs.isUser &&
               lhs.timestamp == rhs.timestamp
    }
}
