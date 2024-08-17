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
            Spacer()
            VStack {
                HStack {
                    
                    
                    NavigationLink(destination: CigsPerDayView()) {
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
                
                Text("And how many cigarettes are in a pack??")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("Blue1"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                TextField("Type here", text: $cigsPerPack)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 100, height: 42)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("Blue2"), lineWidth: 2)
                    )
                    .padding(.horizontal, 39)
                    .padding(.bottom)
                
//                    .padding()
                    NavigationLink(destination: PricePerPackView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(Color("Blue1"))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                userDefault.set(cigsPerPack, forKey: "userCigsPerPack")
                                print(userDefault.string(forKey: "userCigsPerPack") ?? "Error")
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
    CigsPerPackView()
}
