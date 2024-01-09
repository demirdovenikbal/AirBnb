//
//  ExploreView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-06.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            SearchAndFilterBar()
            ScrollView {
                LazyVStack(spacing: 50) {
                    ForEach (0...10, id: \.self) {
                        listing in
                        NavigationLink(value: listing) {
                            ListingItem()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) {
                listing in
                ListingItem()
            }
        }
    }
}

#Preview {
    ExploreView()
}
