//
//  HomeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 19/08/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            AddSmokeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            TrackView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}
#Preview {
    HomeView()
}
