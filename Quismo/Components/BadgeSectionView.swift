//
//  BadgeSectionView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 22/08/24.
//

import SwiftUI

struct BadgeSectionView: View {
    let title: String
    let badges: [BadgeModel]
    @Binding var showCardDetail: Bool
    @Binding var selectedBadge: BadgeModel?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.bottom, 10)
                .padding(.horizontal)
                .foregroundColor(Color(.primary))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(badges) { badge in
                        BadgeCardView(badge: badge, cardWidth: 125, cardHeight: 153)
                            .padding(.trailing, 10)
                            .onTapGesture {
                                selectedBadge = badge
                                showCardDetail = badge.isEarned
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
