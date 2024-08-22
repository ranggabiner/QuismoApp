//
//  BadgeView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 18/08/24.
//

import SwiftUI

struct BadgeView: View {
    @ObservedObject var viewModel: BadgeViewModel
    @State private var showCardDetail = false
    @State private var selectedBadge: BadgeModel?

    init(viewModel: BadgeViewModel = BadgeViewModel(badgeRepository: BadgeRepositories())) {
        self._viewModel = ObservedObject(initialValue: viewModel)
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                BadgeSectionView(title: "Health", badges: viewModel.healthBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
                BadgeSectionView(title: "Money", badges: viewModel.moneyBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
                BadgeSectionView(title: "Time", badges: viewModel.timeBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
            }
            .navigationTitle("Badges")
            .onAppear {
                viewModel.loadBadges()
            }

            if showCardDetail, let badge = selectedBadge {
                BadgeModalView(badge: badge, isPresented: $showCardDetail)
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = BadgeRepositories()
        let viewModel = BadgeViewModel(badgeRepository: repository)
        BadgeView(viewModel: viewModel)
    }
}
