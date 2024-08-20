//
//  OnBoardingViewModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import Combine

class OnBoardingViewModel: ObservableObject {
    @Published var form = OnBoardingModel()
    
    
    func saveData() {
        print("Form saved: \(form)")
    }
}
