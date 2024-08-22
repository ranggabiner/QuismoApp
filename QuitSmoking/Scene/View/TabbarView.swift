//
//  HomeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 19/08/24.
//

import SwiftUI

struct TabbarView: View {
    @State private var showNextView = false
    
    @State var user = UserModel(
        id: UUID(),
        onBoarding: OnBoardingModel(),
        cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
        chatBuddy: ChatLogModel(messages: []),
        chatSessions: [],
        badges: [])
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray1.withAlphaComponent(0.6)
        UITabBar.appearance().shadowImage = UIImage()

    }
    
    var body: some View {
        ZStack {
            
            TabView {
                DashboardView(user: $user)
                    .tabItem {
                        Label("Journey", systemImage: "house.fill")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Chat", systemImage: "bubble.left.and.bubble.right")
                    }
                
                Text("")
                    .tabItem {
                        Label(" ", systemImage: "circle")
                    }
                
                TrackView()
                    .tabItem {
                        Label("Track", systemImage: "calendar")
                    }
                
                TrackView()
                    .tabItem {
                        Label("Badges", systemImage: "trophy")
                    }
            }
            .tabViewStyle(DefaultTabViewStyle())
            
            Button(action: {
                withAnimation {
                    showNextView = true
                }
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Primary"))
                        .frame(width: 57, height: 57)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 5)
                        )
                    Image("MidButton")
                        .resizable()
                        .frame(width: 38, height: 22)
                        .foregroundColor(Color("White"))
                        .font(.system(size: 30, weight: .bold))
                        .padding(.bottom, 9)
                        .sheet(isPresented: $showNextView) {
                            AddSmokeView()
                        }
                }
            }
            .offset(y: 360)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabbarView()
}
