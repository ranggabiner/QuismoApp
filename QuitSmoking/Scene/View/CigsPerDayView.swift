//
//  CigsPerDayView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct CigsPerDayView: View {
    @State private var cigsPerDay: String = ""
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
                        
                        Image("OnboardingProgress2")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("That’s a strong motivation. Let’s dig a little deeper. How many cigarettes do you smoke each day?")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    // nih gimana cara centernya :)
                    TextField(" ", text: $cigsPerDay)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 120, height: 42)
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
                    
                    NavigationLink(destination: CigsPerDayView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(cigsPerDay.isEmpty ? Color("Gray1") : Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(cigsPerDay.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                            .onTapGesture {
                                if !cigsPerDay.isEmpty {
                                    userDefault.set(cigsPerDay, forKey: "userCigsPerDay")
                                    print(userDefault.string(forKey: "userCigsPerDay") ?? "Error")
                                }
                            }
                    }
                    .disabled(cigsPerDay.isEmpty)
                    Spacer()
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CigsPerDayView()
}
