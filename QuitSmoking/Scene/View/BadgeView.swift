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

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                SectionView(title: "Health", badges: viewModel.healthBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
                SectionView(title: "Money", badges: viewModel.moneyBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
                SectionView(title: "Time", badges: viewModel.timeBadges, showCardDetail: $showCardDetail, selectedBadge: $selectedBadge)
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

struct SectionView: View {
    let title: String
    let badges: [BadgeModel]
    @Binding var showCardDetail: Bool
    @Binding var selectedBadge: BadgeModel?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.vertical, 10)
                .padding(.horizontal)
                .foregroundColor(Color(.primary))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(badges) { badge in
                        BadgeCardView(badge: badge, cardWidth: 125, cardHeight: 153)
                            .padding(.trailing, 10)
                            .onTapGesture {
                                selectedBadge = badge
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

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = BadgeRepositories()
        let viewModel = BadgeViewModel(badgeRepository: repository)
        BadgeView(viewModel: viewModel)
    }
}
