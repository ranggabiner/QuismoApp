//
//  QuitReasonView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct QuitReasonView: View {
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var reason: String = ""
    let userDefault = UserDefaults.standard
    @State private var selectedOptions: Set<String> = []
    let options = ["My health", "My family", "My well-being", "To save money", "To have a child", "My freedom"]
    @Binding var currentStep: Int
    @Binding var user: UserModel
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                Image("OnboardingPoppy")
                    .resizable()
                    .frame(width: 176, height: 175)
                    .foregroundStyle(.tint)
                
                Text("Good! Before we start, let's understand why you want to quit smoking?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .padding(.horizontal, 70)
                    .frame(height: 83)
                
                Spacer(minLength: 28)
                
                VStack {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selectedOptions.contains(option) {
                                selectedOptions.remove(option)
                            } else {
                                selectedOptions.insert(option)
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .font(.system(size: 16, weight: .semibold))
                                Spacer()
                                Image(systemName: selectedOptions.contains(option) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(Color("Blue066ACC"))
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 15)
                            .background(selectedOptions.contains(option) ? Color("YellowTint3") : Color("White"))
                            .foregroundColor(Color("Blue055099"))
                            .cornerRadius(12)
                        }
                        .frame(width: 320)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    if !selectedOptions.isEmpty {
                        userQuitReason()
                        withAnimation {
                            currentStep += 1  // Move to the next step
                        }
                    }
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(selectedOptions.isEmpty ? Color("Gray1").opacity(0.6) : Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(selectedOptions.isEmpty ? Color("White") : Color("Blue066ACC"))
                }
                .disabled(selectedOptions.isEmpty)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func userQuitReason() {
        let selectedReasons = Array(selectedOptions)
        user.onBoarding.quitReason = selectedOptions.joined(separator: ", ")
        print(user)
    }
}


