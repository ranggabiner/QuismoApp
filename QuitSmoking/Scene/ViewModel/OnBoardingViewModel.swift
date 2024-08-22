//
//  OnBoardingViewModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import Combine
import Foundation

class OnBoardingViewModel: ObservableObject {
    @Published var form = OnBoardingModel()
    
    var onBoardingUseCase : OnBoardingUseCase
    
    init(onBoardingUseCase: OnBoardingUseCase) {
        self.onBoardingUseCase = onBoardingUseCase
    }
    
    func saveData() {
        print("Form saved: \(form)")
        
        var user = UserModel(
            id: UUID(),
            onBoarding: form,
            cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
            chatBuddy: ChatLogModel(messages: []),
            chatSessions: [],
            badges: [])
        
        onBoardingUseCase.insertUser(user: user)
    }
    
}
