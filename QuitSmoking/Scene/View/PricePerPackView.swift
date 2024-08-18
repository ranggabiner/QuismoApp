//
//  PricePerPackView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct PricePerPackView: View {
    @State private var pricePerPack: String = ""
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
                        
                        Image("OnboardingProgress4")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("And how much do you spend on a pack?")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
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
                                .font(.system(size: 16, weight: .medium))
//                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical)
                        
                        // nih gimana cara centernya :)
                        TextField(" ", text: $pricePerPack)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(width: 120, height: 42)
                            .padding(.horizontal, 10)
                            .background(Color("Primary"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("White"), lineWidth: 2)
                            )
//                            .padding(.horizontal)
                            .padding(.bottom)
                            .foregroundColor(Color("White"))
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                        
                        NavigationLink(destination: NameView()) {
                            Text("Next")
                                .fontWeight(.semibold)
                                .frame(width: 100, height: 42)
                                .background(pricePerPack.isEmpty ? Color("Gray1") : Color("White"))
                                .cornerRadius(10)
                                .foregroundColor(pricePerPack.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                                .onTapGesture {
                                    if !pricePerPack.isEmpty {
                                        userDefault.set(pricePerPack, forKey: "userPricePerPack")
                                        print(userDefault.string(forKey: "userPricePerPack") ?? "Error")
                                    }
                                }
                        }
                        .disabled(pricePerPack.isEmpty)
                        Spacer()
                            .padding()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    #Preview {
        PricePerPackView()
    }

