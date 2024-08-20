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
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var cigAvoided: Int = 0
    @State private var moneySaved: Int = 0
    @State private var smokeFree: Int = 0
    @State private var selectedDate: Date?
    @State private var quitReasons: [String] = []
    @Binding var user: UserModel
    
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

        }
        .onAppear() {
            let insightCigsPerDay = user.onBoarding.cigsPerDay
            let insightCigsPerPack = user.onBoarding.cigsPerPack
            let insightPricePerPack = user.onBoarding.pricePerPack
            let insightQuitDate = user.onBoarding.setDate
            
            let timeElapsed = calculateTimeElapsed()
            
            cigAvoided = Int(insightCigsPerDay * timeElapsed)
            moneySaved = Int(insightPricePerPack * insightCigsPerPack * timeElapsed)
            smokeFree = Int(timeElapsed)
//            cigAvoided = user.onBoarding.cigsPerDay * smokeFree
//            moneySaved = (user.onBoarding.pricePerPack / user.onBoarding.cigsPerPack) * (user.onBoarding.cigsPerDay * smokeFree)
//            smokeFree = calculateTimeElapsed()
            
            
        }
    }
    
    private func calculateTimeElapsed() -> Int {
        let quitDate = user.onBoarding.setDate
        let components = Calendar.current.dateComponents([.day], from: quitDate, to: Date())
        return components.day ?? 0
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

//#Preview {
//    DashboardView(user: $user)
//}
