//
//  MainTabView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            WishlistView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Wishlist")

                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
