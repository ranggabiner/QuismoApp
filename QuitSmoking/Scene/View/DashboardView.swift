//
//  DashboardView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 17/08/24.
//

import SwiftUI

struct DashboardView: View {
    
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
        
        ZStack {
            VStack {
                Spacer()
                
                ZStack {
                    TabView {
                        HomeView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        Text("Chat")
                            .tabItem {
                                Image(systemName: "message")
                                Text("Chat")
                            }
                        
                        Text("")
                            .tabItem {
                            }
                        
                        Text("Track")
                            .tabItem {
                                Image(systemName: "calendar")
                                Text("Track")
                            }
                        
                        Text("Badges")
                            .tabItem {
                                Image(systemName: "trophy")
                                Text("Badges")
                            }
                        
                    }
                    
                    
                    Button(action: {
                        print("Middle tab tapped")
                    }) {
                        ZStack {
                            
                            Circle()
                                .foregroundColor(Color("Blue2"))
                                .frame(width: 75, height: 75)
//                                                            .shadow(radius: 5)
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                        }
                    }
                    .offset(y: 340)
                }
                
            }
            
        }
    }
}

struct HomeView: View {
    @State private var insightCigeratteAvoided: Int = 0
    @State private var insightMoneySaved: Int = 0
    @State private var insightSmokeFree: Int = 0
    
    var body: some View {
        ScrollView {
            
            Spacer()
                .padding()
            
            // mascot
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Image("Mascott")
                        .resizable()
                        .frame(width: 120, height: 120)
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 50)
                                .foregroundColor(Color("Blue4"))
                                .cornerRadius(16)
                            
                            Text("I know you can do it!")
                                .frame(width: 120, height: 50)
                                .font(.system(size: 14, weight: .medium, design: .default))
                                .foregroundColor(.white)
                                .padding()
                            
                            Circle()
                                .foregroundColor(Color("Blue3"))
                                .frame(width: 20, height: 20)
                                .offset(x: -40, y: 25)
                        }
                        Spacer()
                            .padding()
                    }
                    Spacer()
                }
                
                Spacer()
                    .padding(.vertical, 12)
                
                // Insight
                HStack(alignment: .center) {
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "cloud.fog")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 32, weight: .medium))
                        Text("0")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12, weight: .semibold))
                        Text("Cigarette Avoided")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "dollarsign")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 32, weight: .medium))
                        Text("Rp. \(insightMoneySaved)")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12, weight: .semibold))
                        Text("Money Saved")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "flame")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 32, weight: .medium))
                        Text("\(insightSmokeFree) day")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12, weight: .semibold))
                        Text("Smoke free")
                            .foregroundColor(Color("Blue2"))
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    
                }
                
                // divider
                Divider()
                    .background(Color.gray)
                    .padding()
                
                //session
                ZStack {
                    Rectangle()
                        .frame(width: 360, height: 100)
                        .foregroundColor(Color("Blue3"))
                        .cornerRadius(24)
                    
                    HStack {
                        Image("Mascott")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                            .padding(.leading)
                        
                        VStack(alignment: .leading) {
                            Text("Session 1")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                            
                            Text(
                                "Tell me what’s driving you to quit smoking and set your goal!"
                            )
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                            .lineSpacing(0.2)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .frame(width: 360, height: 100)
                    .padding(.horizontal)
                    
                    // Badge
                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Text("On Progress")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .padding(6)
                                    .background(Color.yellow)
                                    .cornerRadius(24)
                                    .padding(.trailing, 8)
                                    .padding(.top, 8)
                            }
                            .offset(x: -15, y: -20)
                        }
                        Spacer()
                    }
                    .frame(width: 360, height: 100)
                }
                .padding()
                ZStack {
                    Rectangle()
                        .frame(width: 360, height: 100)
                        .foregroundColor(Color("Blue3"))
                        .cornerRadius(24)
                        .opacity(0.3)
                    
                    HStack {
                        Image("Mascott")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                            .padding(.leading)
                            .opacity(0.3)
                        
                        VStack(alignment: .leading) {
                            Text("Session 2")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                            
                            Text(
                                "Tell me what’s driving you to quit smoking and set your goal!"
                            )
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                            .lineSpacing(0.2)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .frame(width: 360, height: 100)
                    .padding(.horizontal)
                    
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 30, height: 40)
                        .foregroundColor(Color("Blue1"))
                    
                    // Badge
                    //                        VStack {
                    //                            HStack {
                    //                                Spacer()
                    //                                ZStack {
                    //                                    Text("On Progress")
                    //                                        .font(.caption)
                    //                                        .fontWeight(.medium)
                    //                                        .foregroundColor(.black)
                    //                                        .padding(6)
                    //                                        .background(Color.yellow)
                    //                                        .cornerRadius(24)
                    //                                        .padding(.trailing, 8)
                    //                                        .padding(.top, 8)
                    //                                }
                    //                                .offset(x: -15, y: -20)
                    //                            }
                    //                            Spacer()
                    //                        }
                    //                        .frame(width: 360, height: 100)
                }
            }
        }
        .onAppear {
            let dashUserDefault = UserDefaults.standard
            let dashCigPerDay = dashUserDefault.integer(forKey: "userCigPerDay")
            let dashCigPerPack = dashUserDefault.integer(forKey: "userCigPerPack")
            let dashPricePerPack = dashUserDefault.integer(forKey: "userPricePerPack")
            let timeElapsed = 2
            
            insightCigeratteAvoided = dashCigPerDay * timeElapsed
            
            if dashCigPerPack > 0 {
                insightMoneySaved = (dashPricePerPack / dashCigPerPack) * (dashCigPerDay * timeElapsed)
            } else {
                insightMoneySaved = 0
            }
            
            insightSmokeFree = timeElapsed
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DashboardView()
}
