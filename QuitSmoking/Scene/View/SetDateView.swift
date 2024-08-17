//
//  SetDateView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct SetDateView: View {
    @State private var setDate: String = ""
    let userDefault = UserDefaults.standard
    @State private var selectedDate = Date() // Holds the selected date
    
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
                
                Text("I appreciate you sharing this with me. By the way, what’s your name?")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17, weight: .medium, design: .rounded))
                    .foregroundColor(Color("Blue1"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 39)
                    .padding()
                
                VStack {
                    // Native iOS DatePicker
                    DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle()) // Choose the style you prefer
                        .labelsHidden() // Hides the label to only show the picker
                        .padding()
                    
                    // Optional: Display the selected date
                    Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                        .padding()
                }
                
                //                    .padding()
                NavigationLink(destination: OnboardingEndView()) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(Color("Blue1"))
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            userDefault.set(setDate, forKey: "userSetDate")
                            print(userDefault.string(forKey: "userSetDate") ?? "Error")
                        }
                }
            }
            Spacer()
                .padding()
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
