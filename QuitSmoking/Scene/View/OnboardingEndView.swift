//
//  OnboardingEnd.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct OnboardingEndView: View {
    @ObservedObject var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var showNextView = false
    @Binding var currentStep: Int
    @Binding var user: UserModel
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .padding(.top, 20)
                
                Text("Well done. You’ve taken the first step toward a smoke-free life. I’m here to support you every step of the way.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .frame(height: 83)
                
                Spacer(minLength: 24)
                
                Button(action: {
                    viewModel.saveData(user: user)
                    withAnimation {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showNextView = true
//                        }
                    }
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Blue066ACC"))
                }
                .padding(.top, 20)
                .fullScreenCover(isPresented: $showNextView) {
                    TabbarView()
                }
                
                Spacer()
                
                Image("GreetingsPoppy")
                    .resizable()
                    .frame(width: 393, height: 450)
                    .ignoresSafeArea()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

