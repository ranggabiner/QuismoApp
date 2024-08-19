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
                
                Text("I appreciate you sharing this with me! By the way, what should I call you?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 70)
                    .frame(height: 83)
                
                Spacer(minLength: 28)
                
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
                        .background(name.isEmpty ? Color("Gray1") : Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(name.isEmpty ? Color("White") : Color("Blue066ACC"))
                        .onTapGesture {
                            userDefault.set(Int(name), forKey: "userName")
                            //                            print(userDefault.integer(forKey: "userName"))
                        }
                }
                .padding(.top, 20)
                .disabled(name.isEmpty)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var step = 1
    NameView(currentStep: $step)
}
