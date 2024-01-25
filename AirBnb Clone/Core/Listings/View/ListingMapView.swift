//
//  ListingMapView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-21.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    private let listings : [Listing]
    @State private var selectedListing : Listing?
    @State private var cameraPosition : MapCameraPosition
    init(listings : [Listing], center : CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        let coordinateRegion = MKCoordinateRegion(center: center,
                                                  latitudinalMeters: 50000,
                                                  longitudinalMeters: 50000)
        self._cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    @State private var showDetails = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom) {
                Map(position: $cameraPosition, selection: $selectedListing) {
                    ForEach(listings, id: \.self) { listing in
                        Marker("", coordinate: listing.location)
                            .tag(listing.id)
                    }
                }
                if let selectedListing {
                    withAnimation(.spring) {
                        MapListingPreviewView(listing: selectedListing)
                            .onTapGesture {
                                showDetails.toggle()
                            }
                    }
                }
            }
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .padding(38)
                    .padding(.top, 25)
                
            }
        }
        .fullScreenCover(isPresented: $showDetails, content: {
            if let selectedListing {
                ListingDetailView(listing: selectedListing)
            }
        })
    }
}
#Preview {
    ListingMapView(listings: PreviewProvider().listings)
}

