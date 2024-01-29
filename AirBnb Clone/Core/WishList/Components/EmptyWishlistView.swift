//
//  EmptyWishlistView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-29.
//

import SwiftUI

struct EmptyWishlistView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Create your first wishlist")
                .font(.headline)
            Text("As you explore, tap the heart icon to save your favorite places to a wishlist.")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EmptyWishlistView()
}
