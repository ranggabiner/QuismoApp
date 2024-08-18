//
//  SetDateView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

//struct SetDateView: View {
//    @State private var setDate: String = ""
//    let userDefault = UserDefaults.standard
//    @State private var selectedDate = Date() // Holds the selected date
//
//    var body: some View {
//        NavigationStack {
//            Spacer()
//            VStack {
//                HStack {
//                    NavigationLink(destination: PricePerPackView()) {
//                        Image("back")
//                            .resizable()
//                            .frame(width:12, height: 20)
//                            .padding(.horizontal, 21)
//                    }
//
//                    Spacer()
//
//                    Image("progressBar1")
//                        .resizable()
//                        .frame(width: 196, height: 15)
//
//                    Spacer()
//                    Spacer()
//
//                }
//
//                Spacer()
//                    .padding()
//
//                Image("Mascott")
//                    .resizable()
//                    .frame(width: 120, height: 120)
//                    .foregroundStyle(.tint)
//
//                Text("I appreciate you sharing this with me. By the way, what’s your name?")
//                    .multilineTextAlignment(.center)
//                    .font(.system(size: 17, weight: .medium, design: .rounded))
//                    .foregroundColor(Color("Blue1"))
//                    .lineLimit(nil)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .padding(.horizontal, 39)
//                    .padding()
//
//                VStack {
//                    // Native iOS DatePicker
//                    DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
//                        .datePickerStyle(WheelDatePickerStyle()) // Choose the style you prefer
//                        .labelsHidden() // Hides the label to only show the picker
//                        .padding()
//
//                    // Optional: Display the selected date
//                    Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
//                        .padding()
//                }
//
//                //                    .padding()
//                NavigationLink(destination: OnboardingEndView()) {
//                    Text("Next")
//                        .fontWeight(.semibold)
//                        .frame(width: 100, height: 42)
//                        .background(Color("Blue1"))
//                        .cornerRadius(10)
//                        .foregroundColor(Color.white)
//                        .onTapGesture {
//                            userDefault.set(setDate, forKey: "userSetDate")
//                            print(userDefault.string(forKey: "userSetDate") ?? "Error")
//                        }
//                }
//            }
//            Spacer()
//                .padding()
//        }
//        .navigationBarBackButtonHidden(true)
//
//    }
//    private var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter
//    }
//}
//
//#Preview {
//    SetDateView()
//}

struct SetDateView: View {
    @State private var setDate: String = ""
    let userDefault = UserDefaults.standard
    @State private var selectedDate = Date()
    
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
                        
                        Image("OnboardingProgress7")
                            .resizable()
                            .frame(width: 196, height: 15)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    
                    Image("OnboardingPoppy")
                        .resizable()
                        .frame(width: 176, height: 175)
                        .foregroundStyle(.tint)
                    
                    Text("Excellent! Now, let’s choose your quit date. Pick a day that feels right for you, and we’ll work towards it together.")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color("White"))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 70)
                    
                    VStack {
                        ZStack {
                            Color.white
                            
                            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(WheelDatePickerStyle())
                                .frame(width: 50, height: 200)
                                .labelsHidden()
                                .padding()
                        }
                        .cornerRadius(10)
                        .padding()
                    }
                    
                    NavigationLink(destination: CommitmentView()) {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 42)
                            .background(Color("White"))
                            .cornerRadius(10)
                            .foregroundColor(Color("Blue066ACC"))
                            .onTapGesture {
                                if !setDate.isEmpty {
                                    userDefault.set(setDate, forKey: "userSetDate")
                                    print(userDefault.string(forKey: "userSetDate") ?? "Error")
                                }
                            }
                    }
                    Spacer()
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    SetDateView()
}
