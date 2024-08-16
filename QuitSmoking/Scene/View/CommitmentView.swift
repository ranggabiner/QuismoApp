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
            Spacer()
            VStack {
                HStack {
                    NavigationLink(destination: PricePerPackView()) {
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
                
                Text("Nice to meet you, \(comName). Now, let’s solidify your commitment to quitting. Write down your pledge to yourself.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("button"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                TextField("Type here", text: $commitment)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: 320, height: 42)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("radioCircle"), lineWidth: 2)
                    )
                    .padding(.horizontal, 39)
                    .padding(.bottom)
                
//                    .padding()
                NavigationLink(destination: PricePerPackView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(Color("button"))
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                userDefault.set(commitment, forKey: "userCommitment")
                                print(userDefault.string(forKey: "userCommitment") ?? "Error")
                            }
                    }
                .onAppear() {
                    let commitmentUserDefault = UserDefaults.standard
                    let commitmentName = commitmentUserDefault.string(forKey: "userName")
                    
                    comName = commitmentName ?? "error"
                }
            }
            Spacer()
                .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CommitmentView()
}
