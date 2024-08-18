//
//  NameView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    let userDefault = UserDefaults.standard
    
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
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("I appreciate you sharing this with me! By the way, what’s your name?")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    // nih gimana cara centernya :)
                    TextField(" ", text: $name)
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
                            .background(name.isEmpty ? Color("Gray1") : Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(name.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                            .onTapGesture {
                                if !name.isEmpty {
                                    userDefault.set(name, forKey: "userName")
                                    print(userDefault.string(forKey: "userName") ?? "Error")
                                }
                            }
                    }
                    .disabled(name.isEmpty)
                    Spacer()
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NameView()
}
