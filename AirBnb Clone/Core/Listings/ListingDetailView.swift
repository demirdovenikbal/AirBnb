//
//  ListingDetailView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-09.
//

import SwiftUI

struct ListingDetailView: View {
    var images = ["listing0", "listing1", "listing2", "listing3", "listing4"]
    var body: some View {
        ScrollView {
            ListingImageCarouselView()
                .frame(height: 320)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
}
