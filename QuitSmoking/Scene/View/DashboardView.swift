//
//  DashboardView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 17/08/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var cigAvoided: Int = 0
    @State private var moneySaved: Int = 0
    @State private var smokeFree: Int = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color("Blue1"))
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color("Blue4"))
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color("Blue1"))]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color("Blue4"))]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "star")
                Text("0")
                Text("Cig Avoided")
            }
            Spacer()
            VStack {
                Image(systemName: "star")
                Text("0")
                Text("Money Saved")
            }
            Spacer()
            VStack {
                Image(systemName: "star")
                Text("0")
                Text("Smoke Free")
            }
            Spacer()
        }
        .onAppear {
            let dashUserDefault = UserDefaults.standard
            let dashCigPerDay = dashUserDefault.integer(forKey: "userCigsPerDay")
            let dashCigPerPack = dashUserDefault.integer(forKey: "userCigsPerPack")
            let dashPricePerPack = dashUserDefault.integer(forKey: "userPricePerPack")
            let timeElapsed = 2
            
            cigAvoided = dashCigPerDay * timeElapsed
            if dashCigPerPack > 0 { // Ensure there's no division by zero
                    moneySaved = (dashPricePerPack / dashCigPerPack) * (dashCigPerDay * timeElapsed)
                } else {
                    moneySaved = 0 // Or handle the case as needed
                }
            smokeFree = timeElapsed
        }
    }
}

#Preview {
    DashboardView()
}
