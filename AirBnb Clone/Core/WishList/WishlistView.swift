//
//  WishlistView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-13.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4)
                 {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                LoginButton()
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistView()
}
