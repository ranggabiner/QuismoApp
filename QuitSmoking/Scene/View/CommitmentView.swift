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
                        
                        Image("OnboardingProgress6")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("Nice to meet you \(comName)! Now, let’s solidify your commitment to quitting. Write down your pledge to yourself!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
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
                    
                    NavigationLink(destination: CommitmentView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(commitment.isEmpty ? Color("Gray1") : Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(commitment.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                            .onTapGesture {
                                if !commitment.isEmpty {
                                    userDefault.set(commitment, forKey: "userCommitment")
                                    print(userDefault.string(forKey: "userCommitment") ?? "Error")
                                }
                            }
                    }
                    .disabled(commitment.isEmpty)
                    Spacer()
                        .padding()
                }
                .onAppear() {
                    let commitmentUserDefault = UserDefaults.standard
                    let commitmentName = commitmentUserDefault.string(forKey: "userName")
                    
                    comName = commitmentName ?? "error"
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CommitmentView()
}
