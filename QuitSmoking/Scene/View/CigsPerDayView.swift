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
            Spacer()
            VStack {
                HStack {
                    
                    
                    NavigationLink(destination: QuitReasonView()) {
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
                
                Text("That’s a strong motivation. Let’s dig a little deeper. How many cigarettes do you smoke each day?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("Blue1"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                TextField("Type here", text: $cigsPerDay)
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
                    NavigationLink(destination: CigsPerPackView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(Color("Blue1"))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                userDefault.set(cigsPerDay, forKey: "userCigsPerDay")
                                print(userDefault.string(forKey: "userCigsPerDay") ?? "Error")
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
    CigsPerDayView()
}
