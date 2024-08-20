//
//  DashboardView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 17/08/24.
//

import SwiftUI

//struct DashboardView: View {
//    @State private var cigAvoided: Int = 0
//    @State private var moneySaved: Int = 0
//    @State private var smokeFree: Int = 0
//
//    var body: some View {
//        HStack {
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("\(cigAvoided)")
//                Text("Cig Avoided")
//            }
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("Rp. \(moneySaved)")
//                Text("Money Saved")
//            }
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("\(smokeFree)")
//                Text("Smoke Free")
//            }
//            Spacer()
//        }
//        .onAppear {
//            let dashUserDefault = UserDefaults.standard
//            let dashCigPerDay = dashUserDefault.integer(forKey: "userCigsPerDay")
//            let dashCigPerPack = dashUserDefault.integer(forKey: "userCigsPerPack")
//            let dashPricePerPack = dashUserDefault.integer(forKey: "userPricePerPack")
//            let timeElapsed = 2
//
//            cigAvoided = dashCigPerDay * timeElapsed
//            if dashCigPerPack > 0 { // Ensure there's no division by zero
//                    moneySaved = (dashPricePerPack / dashCigPerPack) * (dashCigPerDay * timeElapsed)
//                } else {
//                    moneySaved = 0 // Or handle the case as needed
//                }
//            smokeFree = timeElapsed
//        }
//    }
//}
//
//#Preview {
//    DashboardView()
//}

struct DashboardView: View {
    @State private var cigAvoided: Int = 0
    @State private var moneySaved: Int = 0
    @State private var smokeFree: Int = 0
    @State private var selectedDate: Date?
    @State private var quitReasons: [String] = []
    @State private var timeElapsed: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "star")
                    Text("\(cigAvoided)")
                    Text("Cig Avoided")
                }
                Spacer()
                VStack {
                    Image(systemName: "star")
                    Text("Rp. \(moneySaved)")
                    Text("Money Saved")
                }
                Spacer()
                VStack {
                    Image(systemName: "star")
                    Text("\(smokeFree)")
                    Text("Smoke Free")
                }
                Spacer()
            }
            
            .padding()
            
            HStack {
                Spacer()
                Text("Quit Date: \(selectedDate != nil ? dateFormatter.string(from: selectedDate!) : "Not Set")")
                Spacer()
                Text("Reason: \(quitReasons.joined(separator: ", "))")
                Spacer()
            }
        }
        .onAppear {
            let dashUserDefault = UserDefaults.standard
            let dashCigPerDay = dashUserDefault.integer(forKey: "userCigsPerDay")
            let dashCigPerPack = dashUserDefault.integer(forKey: "userCigsPerPack")
            let dashPricePerPack = dashUserDefault.integer(forKey: "userPricePerPack")
            
            print("Cig Per Day: \(dashCigPerDay)")
            print("Cig Per Pack: \(dashCigPerPack)")
            print("Price Per Pack: \(dashPricePerPack)")
            print("Time Elapsed: \(timeElapsed)")
            
            // Retrieve and parse quit date
            let dashQuitDateStr = dashUserDefault.string(forKey: "userSetDate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            if let quitDateStr = dashQuitDateStr {
                selectedDate = dateFormatter.date(from: quitDateStr)
            } else {
                selectedDate = nil
            }
            
            // Calculate timeElapsed
            if let quitDate = selectedDate {
                let currentDate = Date()
                let calendar = Calendar.current
                let components = calendar.dateComponents([.day], from: quitDate, to: currentDate)
                timeElapsed = components.day ?? 0
            } else {
                timeElapsed = 0
            }
            
            // Calculate cigAvoided, moneySaved, and smokeFree
            cigAvoided = dashCigPerDay * timeElapsed
            if dashCigPerPack > 0 {
                moneySaved = (dashPricePerPack / dashCigPerPack) * (dashCigPerDay * timeElapsed)
            } else {
                moneySaved = 0
            }
            smokeFree = timeElapsed
            
            // Retrieve quit reasons
            quitReasons = dashUserDefault.array(forKey: "userReason") as? [String] ?? []
        }
    }
    
    private func calculateTimeElapsed() -> Int {
        guard let quitDate = selectedDate else { return 0 }
        let components = Calendar.current.dateComponents([.day], from: quitDate, to: Date())
        return components.day ?? 0
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    DashboardView()
}
