//
//  ListingImageCarouselView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-09.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing : Listing
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) {
                image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: PreviewProvider().listings[0])
}
