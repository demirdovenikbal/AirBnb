//
//  ListingView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-06.
//

import SwiftUI

struct ListingItem: View {
    let listing : Listing
    var body: some View {
        VStack(spacing: 8) {
            //images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //listing details
            HStack(alignment: .top) {
                //details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack (spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                //rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating.formatted())")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItem(listing: PreviewProvider().listings[0])
}
