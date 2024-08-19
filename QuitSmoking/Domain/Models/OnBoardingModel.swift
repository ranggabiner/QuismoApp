//
//  OnBoardingModel.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import Foundation

struct OnBoardingModel : Codable {
    var quitReason: String = ""
    var cigsPerDay: Int = 0
    var pricePerPack: Int = 0
    var name: String = ""
}

