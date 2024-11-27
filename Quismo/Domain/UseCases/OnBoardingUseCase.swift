//
//  OnBoardingUseCase.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 20/08/24.
//

import Foundation

class OnBoardingUseCase{
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func insertUser(user: UserModel){
        repository.insert(user: user)
    }
}
