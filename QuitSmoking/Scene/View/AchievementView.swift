//
//  AchievementView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct AchievementView: View {
    @ObservedObject var viewModel: AchievementViewModel

    var body: some View {
        VStack(alignment: .leading) {
            SectionView(title: "Health", achievements: viewModel.healthAchievements)
            SectionView(title: "Money", achievements: viewModel.moneyAchievements)
            SectionView(title: "Time", achievements: viewModel.timeAchievements)
        }
        .navigationTitle("Achievements")
        .onAppear {
            viewModel.loadAchievements()
        }
    }
}

struct SectionView: View {
    let title: String
    let achievements: [Achievement]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(achievements) { achievement in
                        AchievementCardView(achievement: achievement)
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


