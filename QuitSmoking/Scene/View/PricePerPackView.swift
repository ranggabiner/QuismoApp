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
            Spacer()
            VStack {
                HStack {
                    NavigationLink(destination: CigsPerPackView()) {
                        Image("back")
                            .resizable()
                            .frame(width:12, height: 20)
                            .padding(.horizontal, 21)
                    }
                    
                    Spacer()
                    
                    Image("progressBar1")
                        .resizable()
                        .frame(width: 196, height: 15)
                    
                    Spacer()
                    Spacer()
                    
                }
                
                Spacer()
                    .padding()
                
                Image("Mascott")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.tint)
                
                Text("And how much do you spend on a pack?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("Blue1"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 90, height: 42)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("Blue2"), lineWidth: 2) // Same stroke as TextField
                            )
                            .padding(.horizontal, 2)
                        
                        Text("Rp")
                            .foregroundColor(Color("Blue1")) // Matching color with stroke
                            .font(.system(size: 16, weight: .medium))
                    }
                    
                    TextField("Type here", text: $pricePerPack)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 200, height: 42)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("Blue2"), lineWidth: 2)
                        )
                        .padding(.horizontal, 2)
                }
                
                .padding()
                NavigationLink(destination: NameView()) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(Color("Blue1"))
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            userDefault.set(pricePerPack, forKey: "userPricePerPack")
                            print(userDefault.string(forKey: "userPricePerPack") ?? "Error")
                        }
                }
            }
            Spacer()
                .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PricePerPackView()
}
