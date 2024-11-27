//
//  OnBoardingModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import Foundation

struct OnBoardingModel : Codable {
    var quitReason: String = ""
    var cigsPerDay: Int = 1
    var cigsPerPack: Int = 1
    var pricePerPack: Int = 1
    var name: String = ""
    var setDate: Date = Date()
    
}

