//
//  MapListingPreviewView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-23.
//

import SwiftUI

struct MapListingPreviewView: View {
    let listing : Listing
    var body: some View {
        VStack {
            TabView {
                ForEach(listing.imageURLs, id: \.self) {
                    image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    Text("7 nights: Dec 12 - Dec 19")
                        .foregroundStyle(.gray)
                    HStack {
                        Text("$\(listing.pricePerNight)")
                        Text("night")
                    }
                    .fontWeight(.semibold)
                }
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                    Text("\(listing.rating.formatted())")
                }
                .fontWeight(.semibold)
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    MapListingPreviewView(listing: PreviewProvider().listings[0])
}
