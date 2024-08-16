//
//  QuitReasonView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct QuitReasonView: View {
    @State private var reason: String = ""
    let userDefault = UserDefaults.standard
    @State private var selectedOptions: Set<String> = []
    let options = ["My health", "My family", "My well-being", "To save money", "To have a child", "My freedom"]
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                HStack {
                    
                    
                    NavigationLink(destination: GreetingsView(viewModel: OnBoardingViewModel())) {
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
                
                Text("Great to hear. Before we begin, I’d like to understand what’s driving you to quit. What’s your main reason?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("button"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                VStack(alignment: .leading, spacing: 7) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            if selectedOptions.contains(option) {
                                selectedOptions.remove(option)
                            } else {
                                selectedOptions.insert(option)
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .font(.system(size: 16, weight: .medium, design: .default))
                                Spacer()
                                Image(systemName: selectedOptions.contains(option) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(Color("radioCircle"))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(selectedOptions.contains(option) ? Color("radioButton") : Color("radioButton"))
                            .foregroundColor(Color("button"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("radioCircle"), lineWidth: selectedOptions.contains(option) ? 2 : 0)
                            )
                        }
                        .frame(width: 320)
                    }
                }
                
                .padding()
                NavigationLink(destination: CigsPerDay(viewModel: OnBoardingViewModel())) {
                    Text("Next")
                        .frame(width: 80, height: 50)
                        .background(Color("button"))
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            userDefault.set(reason, forKey: "userReason")
                            print(userDefault.string(forKey: "userReason") ?? "Error")
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
    QuitReasonView()
}
