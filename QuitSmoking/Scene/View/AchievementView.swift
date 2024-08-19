//
//  AchievementView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct AchievementView: View {
    @ObservedObject var viewModel: AchievementViewModel
        @State private var showCardDetail = false
        @State private var selectedAchievement: Achievement?

        var body: some View {
            ZStack {
                VStack(alignment: .leading) {
                    SectionView(title: "Health", achievements: viewModel.healthAchievements, showCardDetail: $showCardDetail, selectedAchievement: $selectedAchievement)
                    SectionView(title: "Money", achievements: viewModel.moneyAchievements, showCardDetail: $showCardDetail, selectedAchievement: $selectedAchievement)
                    SectionView(title: "Time", achievements: viewModel.timeAchievements, showCardDetail: $showCardDetail, selectedAchievement: $selectedAchievement)
                }
                .navigationTitle("Achievements")
                .onAppear {
                    viewModel.loadAchievements()
                }

                if showCardDetail, let achievement = selectedAchievement {
                    AchievementModal(achievement: achievement, isPresented: $showCardDetail)
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
        }
}

struct SectionView: View {
    let title: String
    let achievements: [Achievement]
    @Binding var showCardDetail: Bool
    @Binding var selectedAchievement: Achievement?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.vertical, 10)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(achievements) { achievement in
                        AchievementCard(achievement: achievement)
                            .padding(.trailing, 10)
                            .onTapGesture {
                                selectedAchievement = achievement
                                showCardDetail = true
                            }
                    }
                    .onTapGesture {
                        showCardDetail = true
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = AchievementRepositories()
        let useCase = FetchAchievements(repository: repository)
        let viewModel = AchievementViewModel(fetchAchievements: useCase)
        AchievementView(viewModel: viewModel)
    }
}
