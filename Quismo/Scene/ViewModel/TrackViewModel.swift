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
    @Published var setDate: Date?
    @Published var showFailedLog: Bool = true
    
    var cigaretteLogUseCase : CigaretteLogUseCase
    
    init(cigaretteLogUseCase: CigaretteLogUseCase) {
        self.cigaretteLogUseCase = cigaretteLogUseCase
        fetch()
    }
    
    func fetch(){
        self.cigaretteLog = cigaretteLogUseCase.fetchCigaretteLog()
        self.setDate = cigaretteLogUseCase.fetchSetDate()
    }
    
    //testing
    func addSmoke(){
        cigaretteLogUseCase.addSmoke()
        fetch()
    }
    
    func isDateValid(date: Date) -> Bool {
        return date <= Date()
    }
    
    func isDateAfterSetDate(date: Date) -> Bool {
        guard let setDate = setDate else { return false }
        return date >= setDate
    }
    
    func isDateInLog(date: Date) -> Bool {
        let dateToCheck = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let logDates = cigaretteLog?.cigarettesSmoked ?? []
        
        return logDates.contains { logDate in
            let logDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: logDate)
            return logDateComponents == dateToCheck
        }
    }
    
    func dateFromComponents(monthIndex: Int, dayIndex: Int) -> Date? {
        return DateComponents(calendar: Calendar.current, year: 2024, month: 1 + monthIndex, day: 1 + dayIndex).date
    }
}
