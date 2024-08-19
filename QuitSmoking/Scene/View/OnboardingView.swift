//
//  Untitled.swift
//  QuitSmoking
//
//  Created by PadilKeren on 19/08/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep: Int = 1
    private let totalSteps = 8
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // ProgressBarView at the top
                ProgressBarView(currentStep: currentStep, onBackButtonPressed: {
                    if currentStep > 1 {
                        withAnimation {
                            currentStep -= 1
                        }
                    }
                })
                .padding(.top, 65) // Adjust top padding as needed (progress bar)
                
                // TabView for swipe animation
                TabView(selection: $currentStep) {
                    ForEach(1...totalSteps, id: \.self) { step in
                        viewForStep(step)
                            .tag(step)
                            .padding(.top, 0) // Add padding to ensure content is not stacked (content)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Disable page dots
            }
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private func viewForStep(_ step: Int) -> some View {
        switch step {
        case 1:
            QuitReasonView(currentStep: $currentStep)
        case 2:
            CigsPerDayView(currentStep: $currentStep)
        case 3:
            CigsPerPackView(currentStep: $currentStep)
        case 4:
            PricePerPackView(currentStep: $currentStep)
        case 5:
            NameView(currentStep: $currentStep)
        case 6:
            CommitmentView(currentStep: $currentStep)
        case 7:
            SetDateView(currentStep: $currentStep)
        case 8:
            OnboardingEndView(currentStep: $currentStep)
        default:
            EmptyView()
        }
    }
}

#Preview {
    OnboardingView()
}

//struct OnboardingView: View {
//    @State private var currentStep: Int = 1
//    
//    var body: some View {
//        ZStack {
//            Color("Primary")
//                .ignoresSafeArea()
//            VStack {
//                ProgressBarView(currentStep: currentStep, onBackButtonPressed: {
//                    if currentStep > 1 {
//                        currentStep -= 1
//                    }
//                })
//                
//                if currentStep == 1 {
//                    QuitReasonView(currentStep: $currentStep)
//                } else if currentStep == 2 {
//                    CigsPerDayView(currentStep: $currentStep)
//                }
//                
//                if currentStep == 3 {
//                    CigsPerPackView(currentStep: $currentStep)
//                } else if currentStep == 4 {
//                    PricePerPackView(currentStep: $currentStep)
//                }
//                
//                if currentStep == 5 {
//                    NameView(currentStep: $currentStep)
//                } else if currentStep == 6 {
//                    CommitmentView(currentStep: $currentStep)
//                }
//                
//                if currentStep == 7 {
//                    SetDateView(currentStep: $currentStep)
//                } else if currentStep == 8 {
//                    OnboardingEndView(currentStep: $currentStep)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    OnboardingView()
//}
