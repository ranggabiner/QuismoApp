//
//  UserRepository.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation
import SwiftData

protocol UserRepository{
    func fetch() -> UserModel
    func insert(user: UserModel)
    func update(user: UserModel)
}

class LocalUserRepository: UserRepository{
    private let container = SwiftDataManager.shared.container
    
    @MainActor func fetch() -> UserModel {
        do {
            let fetchDescriptor = FetchDescriptor<UserStorage>()
            let localUsers = try self.container?.mainContext.fetch(fetchDescriptor)
            let models = localUsers?.compactMap { $0.toDomain() } ?? []
            return models[0]
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //harus dipanggil 1x, no more, no less
    @MainActor func insert(user: UserModel){
        let newUser = UserStorage(id: user.id, onBoarding: user.onBoarding, cigaretteLog: user.cigaretteLog, chatBuddy: user.chatBuddy, chatSessions: user.chatSessions, badges: user.badges)
        container?.mainContext.insert(newUser)
    }
    
    @MainActor func update(user: UserModel){
        do{
            let fetchDescriptor = FetchDescriptor<UserStorage>()
            var localUsers = try self.container?.mainContext.fetch(fetchDescriptor)
            
            localUsers?[0].cigaretteLog.cigarettesSmoked = user.cigaretteLog.cigarettesSmoked
            try container?.mainContext.save()
        } catch{
            fatalError(error.localizedDescription)
        }
    }
}
