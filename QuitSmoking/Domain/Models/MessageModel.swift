//
//  MessageModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

struct MessageModel: Identifiable , Codable{
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}
