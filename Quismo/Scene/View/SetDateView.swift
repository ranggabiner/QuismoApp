//
//  SetDateView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 16/08/24.
//

import SwiftUI

struct SetDateView: View {
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var setDate: String = ""
    @State private var selectedDate = Date() {
        didSet {
            userSelectedDate()
        }
    }
    @State private var showNextView = false
    @Binding var currentStep: Int
    @Binding var user: UserModel
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("OnboardingPoppy")
                    .resizable()
                    .frame(width: 176, height: 175)
                    .foregroundStyle(.tint)
                Text("Excellent! Now, let’s choose your quit date. Pick a day that feels right for you, and we’ll work towards it together.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("White"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 40)
                    .frame(height: 83)
                VStack {
                    ZStack {
                        Color.white
                        
                        DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .frame(width: 50, height: 200)
                            .labelsHidden()
                            .padding()
                            .onChange(of: selectedDate) { newDate in
                                let calendar = Calendar.current
                                let dateComponents = calendar.dateComponents([.year, .month, .day], from: newDate)
                                if let dateWithZeroTime = calendar.date(from: dateComponents) {
                                    user.onBoarding.setDate = dateWithZeroTime
                                    userSelectedDate()
                                }
                            }

                    }
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                Spacer()
                
                Button(action: {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .medium
                    let dateString = dateFormatter.string(from: selectedDate)
                    UserDefaults.standard.set(dateString, forKey: "userSetDate")
                    withAnimation {
                        currentStep += 1  // Move to the next step or finish
                    }
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 42)
                        .background(Color("White"))
                        .cornerRadius(10)
                        .foregroundColor(Color("Blue066ACC"))
                }
//                .padding(.top, 20)
                //                    .disabled(selectedDate.isEmpty)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private func userSelectedDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: selectedDate)
        UserDefaults.standard.set(dateString, forKey: "userSelectedDate")
    }
}

