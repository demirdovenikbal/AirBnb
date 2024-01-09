//
//  ListingImageCarouselView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-09.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = ["listing0", "listing1", "listing2", "listing3", "listing4"]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) {
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
    ListingImageCarouselView()
}
