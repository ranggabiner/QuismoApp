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
    
    func saveData(user: UserModel) {
        print("Form saved: \(form)")
        
        onBoardingUseCase.insertUser(user: user)
    }
    
}
