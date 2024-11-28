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
    
    @State var user = UserModel(
        id: UUID(),
        onBoarding: OnBoardingModel(),
        cigaretteLog: CigaretteLogModel(cigarettesSmoked: []),
        badges: [],
        message : MessageModel(),
        companionChatHistory : CompanionChatHistoryModel()
)
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    
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
    }
    
    @ViewBuilder
    private func viewForStep(_ step: Int) -> some View {
        switch step {
        case 1:
            QuitReasonView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 2:
            CigsPerDayView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 3:
            CigsPerPackView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 4:
            PricePerPackView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 5:
            NameView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 6:
            CommitmentView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 7:
            SetDateView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        case 8:
            OnboardingEndView(viewModel: viewModel, currentStep: $currentStep, user: $user)
        default:
            EmptyView()
        }
    }
}

#Preview {
    OnboardingView()
}
