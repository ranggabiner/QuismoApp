//
//  CommitmentView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct CommitmentView: View {
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var commitment: String = ""
    let userDefault = UserDefaults.standard
    @State private var comName: String = ""
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
                
                Text("Nice to meet you \(comName)! Now, let’s solidify your commitment to quitting. Write down your pledge to yourself!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .frame(height: 83)
                
                    .padding(.bottom, 10)
                
                // nih gimana cara centernya :)
                TextField("I want to QUIT!", text: $commitment)
                    .textFieldStyle(PlainTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .frame(width: 290, height: 42)
                    .padding(.horizontal, 10)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("White"), lineWidth: 2)
                    )
                    .padding(.horizontal, 39)
                    .padding(.bottom)
                    .foregroundColor(Color("White"))
                    .font(.system(size: 16, weight: .medium))
                
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
                        .background(commitment.isEmpty ? Color("Gray1") : Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(commitment.isEmpty ? Color("White") : Color("Blue066ACC"))
                    //                        .onTapGesture {
                    //                            userDefault.set(Int(commitment), forKey: "userCommitment")
                    //                            print(userDefault.integer(forKey: "userCommitment"))
                    //                        }
                }
                .padding(.bottom, keyboardHeight)
                .disabled(commitment.isEmpty)
                
            }
            .onAppear() {
                if let commitmentName = UserDefaults.standard.string(forKey: "name") {
                    comName = commitmentName
                } else {
                    comName = "error"
                }
                
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

