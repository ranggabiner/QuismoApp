//
//  HomeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 19/08/24.
//

import SwiftUI

struct TabbarView: View {
    @State private var goToAddSmokeView = false
    
    @State var user = UserModel(
        id: UUID(),
        onBoarding: OnBoardingModel(),
        cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
        badges: [],
        message: MessageModel(),
        companionChatHistory: CompanionChatHistoryModel()
    )
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray1.withAlphaComponent(0.6)
        UITabBar.appearance().shadowImage = UIImage()

    }
    
    var body: some View {
        ZStack {
            
            TabView {
                DashboardView()
                    .tabItem {
                        Label("Journey", systemImage: "house.fill")
                    }
                
                ChatBuddyView()
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
                
                BadgeView()
                    .tabItem {
                        Label("Badges", systemImage: "trophy")
                    }
            }
            .tabViewStyle(DefaultTabViewStyle())
            
            Button(action: {
                withAnimation {
                    goToAddSmokeView = true
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
                        .sheet(isPresented: $goToAddSmokeView) {
                            AddSmokeView()
                        }
                }
            }
            .offset(y: 360)
            
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    TabbarView()
//}
