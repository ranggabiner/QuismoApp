//
//  CigsPerPackView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct CigsPerPackView: View {
    @State private var cigsPerPack: String = ""
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
                        
                        Image("OnboardingProgress3")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("And how many cigarettes are in a pack?")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    // nih gimana cara centernya :)
                    TextField(" ", text: $cigsPerPack)
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
                    
                    NavigationLink(destination: PricePerPackView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(cigsPerPack.isEmpty ? Color("Gray1") : Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(cigsPerPack.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                            .onTapGesture {
                                if !cigsPerPack.isEmpty {
                                    userDefault.set(cigsPerPack, forKey: "userCigsPerPack")
                                    print(userDefault.string(forKey: "userCigsPerPack") ?? "Error")
                                }
                            }
                    }
                    .disabled(cigsPerPack.isEmpty)
                    Spacer()
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CigsPerPackView()
}
