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
            ZStack {
                Color("Primary")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        NavigationLink(destination: GreetingsView(viewModel: OnBoardingViewModel())) {
                            Image("Back")
                                .resizable()
                                .frame(width:12, height: 20)
                                .padding(.horizontal, 21)
                        }
                        
                        Spacer()
                        
                        Image("OnboardingProgress1")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("Great to hear. Before we begin, I’d like to understand what’s driving you to quit. What’s your main reason?")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    VStack {
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
                                        .font(.system(size: 16, weight: .semibold))
                                    Spacer()
                                    Image(systemName: selectedOptions.contains(option) ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(Color("Blue066ACC"))
                                }
                                .padding(.vertical, 14)
                                .padding(.horizontal, 15)
                                .background(selectedOptions.contains(option) ? Color("YellowTint3") : Color("White"))
                                .foregroundColor(Color("Blue055099"))
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("Blue2"), lineWidth: selectedOptions.contains(option) ? 2 : 0)
                                )
                            }
                            .frame(width: 320)
                        }
                    }
                    
                    NavigationLink(destination: CigsPerDayView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(selectedOptions.isEmpty ? Color("Gray1") : Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(selectedOptions.isEmpty ? (Color("White")) : (Color("Blue066ACC")))
                            .onTapGesture {
                                if !selectedOptions.isEmpty {
                                    userDefault.set(reason, forKey: "userReason")
                                    print(userDefault.string(forKey: "userReason") ?? "Error")
                                }
                            }
                    }
                    .disabled(selectedOptions.isEmpty)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    QuitReasonView()
}
