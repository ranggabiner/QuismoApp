//
//  CommitmentView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct CommitmentView: View {
    @State private var commitment: String = ""
    let userDefault = UserDefaults.standard
    @State private var comName: String = ""
    @State private var showNextView = false
    @Binding var currentStep: Int
    
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
                
                Spacer(minLength: 28)
                
                // nih gimana cara centernya :)
                TextField(" ", text: $commitment)
                    .textFieldStyle(PlainTextFieldStyle())
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
                    .padding()
                
                Button(action: {
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
                        .onTapGesture {
                            userDefault.set(Int(commitment), forKey: "userCommitment")
                            //                            print(userDefault.integer(forKey: "userCommitment"))
                        }
                }
                .padding(.top, 20)
                .disabled(commitment.isEmpty)
                
            }
            .onAppear() {
                let commitmentUserDefault = UserDefaults.standard
                let commitmentName = commitmentUserDefault.string(forKey: "userName")
                
                comName = commitmentName ?? "error"
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var step = 1
    CommitmentView(currentStep: $step)
}
