//
//  PricePerPackView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct PricePerPackView: View {
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var pricePerPack: String = ""
    let userDefault = UserDefaults.standard
    @State private var showNextView = false
    @Binding var currentStep: Int
    @Binding var user: UserModel
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("OnboardingPoppy")
                    .resizable()
                    .frame(width: 176, height: 175)
                    .foregroundStyle(.tint)
                
                Text("And how much do you spend on a pack?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 70)
                    .frame(height: 83)
                
                    .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color("Primary"))
                            .frame(width: 60, height: 42)
                            .padding(.horizontal, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("White"), lineWidth: 2)
                            )
                        //                                .padding(.horizontal)
                            .padding(.bottom)
                            .foregroundColor(Color("BlueA1D0FF"))
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Rp")
                            .foregroundColor(Color("White"))
                            .font(.system(size: 16, weight: .semibold))
                        //                                .padding(.horizontal)
                            .padding(.bottom)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical)
                    
                    // nih gimana cara centernya :)
                    TextField("Type here...", text: $pricePerPack)
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .frame(width: 120, height: 42)
                        .padding(.horizontal, 10)
                        .background(Color("BlueTint3"))
                        .cornerRadius(10)
                        .padding(.bottom)
                        .foregroundColor(Color("BlueShade3"))
                        .font(.system(size: 16, weight: .semibold))
                        .onChange(of: pricePerPack) { newValue in
                            if let intValue = Int(newValue) {
                                user.onBoarding.pricePerPack = intValue
                            } else {
                                user.onBoarding.pricePerPack = 0
                            }
                        }
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    withAnimation {
                        currentStep += 1  // Move to the next step
                    }
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(pricePerPack.isEmpty ? Color("Gray1").opacity(0.6) : Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(pricePerPack.isEmpty ? Color("White") : Color("Blue066ACC"))
                    //                        .onTapGesture {
                    //                            userDefault.set(Int(pricePerPack), forKey: "userPricePerPack")
                    //                            print(userDefault.integer(forKey: "userPricePerPack"))
                    //                        }
                }
                .padding(.bottom, keyboardHeight)
                .disabled(pricePerPack.isEmpty)
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                    if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        withAnimation {
                            keyboardHeight = keyboardFrame.height - 20 // Subtract some padding if needed
                        }
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                    withAnimation {
                        keyboardHeight = 0
                    }
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

