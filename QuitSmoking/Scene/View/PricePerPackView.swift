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
                
                Text("And how much do you spend on a pack?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 70)
                    .frame(height: 83)
                
                Spacer(minLength: 28)
                
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
                        .background(pricePerPack.isEmpty ? Color("Gray1") : Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(pricePerPack.isEmpty ? Color("White") : Color("Blue066ACC"))
                        .onTapGesture {
                            userDefault.set(Int(pricePerPack), forKey: "userPricePerPack")
                            //                            print(userDefault.integer(forKey: "userPricePerPack"))
                        }
                }
                .padding(.top, 20)
                .disabled(pricePerPack.isEmpty)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var step = 1
    PricePerPackView(currentStep: $step)
}
