//
//  TrackViewModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 19/08/24.
//

import Foundation

class TrackViewModel: ObservableObject{
    let x: Int = 312
    let months = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    @Published var cigaretteLog: CigaretteLogModel?
    @Published var showFailedLog: Bool = true
    
    var cigaretteLogUseCase : CigaretteLogUseCase
    
    init(cigaretteLogUseCase: CigaretteLogUseCase) {
        self.cigaretteLogUseCase = cigaretteLogUseCase
        fetch()
    }
    
    func fetch(){
        self.cigaretteLog = cigaretteLogUseCase.fetch()
    }
    
    //testing
    func addSmoke(){
        cigaretteLogUseCase.addSmoke()
        fetch()
    }

}
