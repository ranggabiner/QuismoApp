//
//  AddSmokeViewModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 18/08/24.
//

import Foundation

class AddSmokeViewModel: ObservableObject{
    @Published var cigaretteLog: CigaretteLogModel?
    
    var cigaretteLogUseCase : CigaretteLogUseCase
    
    init(cigaretteLogUseCase: CigaretteLogUseCase) {
        self.cigaretteLogUseCase = cigaretteLogUseCase
        fetch()
    }
    
    func addSmoke(){
        cigaretteLogUseCase.addSmoke()
        fetch()
    }
    
    func fetch(){
        self.cigaretteLog = cigaretteLogUseCase.fetchCigaretteLog()
    }
}
