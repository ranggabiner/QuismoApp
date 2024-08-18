//
//  OnboardingEnd.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

//struct OnboardingEndView: View {
//    
//    var body: some View {
//        NavigationStack {
//            Spacer()
//            VStack {
//                HStack {
//                    NavigationLink(destination: PricePerPackView()) {
//                        Image("back")
//                            .resizable()
//                            .frame(width:12, height: 20)
//                            .padding(.horizontal, 21)
//                    }
//                    
//                    Spacer()
//                    
//                    Image("progressBar1")
//                        .resizable()
//                        .frame(width: 196, height: 15)
//                    
//                    Spacer()
//                    Spacer()
//                    
//                }
//                
//                Spacer()
//                    .padding()
//                
//                Image("Mascott")
//                    .resizable()
//                    .frame(width: 120, height: 120)
//                    .foregroundStyle(.tint)
//                
//                Spacer()
//                    .padding()
//                
//                Text("Well done. You’ve taken the first step toward a smoke-free life. I’m here to support you every step of the way.")
//                    .multilineTextAlignment(.center)
//                    .font(.system(size: 17, weight: .medium, design: .rounded))
//                    .foregroundColor(Color("Blue1"))
//                    .lineLimit(nil)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .padding(.horizontal, 39)
//                    .padding()
//                
////                    .padding()
//                NavigationLink(destination: DashboardView()) {
//                        Text("Next")
//                            .fontWeight(.semibold)
//                            .frame(width: 100, height: 42)
//                            .background(Color("Blue1"))
//                            .cornerRadius(10)
//                            .foregroundColor(Color.white)
//                    }
//            }
//            Spacer()
//                .padding()
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//#Preview {
//    OnboardingEndView()
//}

struct OnboardingEndView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Primary")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        NavigationLink(destination: QuitReasonView()) {
                            Image("Back")
                                .resizable()
                                .frame(width:12, height: 20)
                                .padding(.horizontal, 21)
                        }
                        
                        Spacer()
                        
                        Image("OnboardingProgress5")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Text("Well done. You’ve taken the first step toward a smoke-free life. I’m here to support you every step of the way.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    NavigationLink(destination: CommitmentView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(Color("Blue066ACC"))
                    }
                    
                    Spacer()
                    
                    Image("GreetingsPoppy")
                    .resizable()
                        .frame(width: 393, height: 450)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingEndView()
}
