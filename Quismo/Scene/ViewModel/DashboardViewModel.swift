//
//  DashboardViewModel.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 22/08/24.
//

import Foundation

class DashboardViewModel: ObservableObject{
    var dashboardUseCase : DashboardUseCase
    
    @Published var cigaretteAvoided: String = ""
    @Published var moneySaved: String = ""
    @Published var smokeFree: String = ""
    
    init(dashboardUseCase: DashboardUseCase) {
        self.dashboardUseCase = dashboardUseCase
//        fetch()
    }
    
    func getCigaretteAvoided() -> String{
        return String(dashboardUseCase.getCigaretteAvoided())
    }
    
    func getMoneySaved() -> Int{
        return dashboardUseCase.getMoneySaved()
    }
    
    func getSmokeFree() -> String{
        return String(dashboardUseCase.getSmokeFree())
    }
    
    func fetch(){
        cigaretteAvoided = getCigaretteAvoided()
        moneySaved = formatToRupiah(getMoneySaved())
        smokeFree = getSmokeFree()
        
        print(cigaretteAvoided)
        print(moneySaved)
        print(smokeFree)
    }
    
    func formatToRupiah(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        formatter.maximumFractionDigits = 0  // Rupiah doesn't usually display decimals
        if let formattedString = formatter.string(from: NSNumber(value: value)) {
            return formattedString
        } else {
            return "Rp0"
        }
    }
}
