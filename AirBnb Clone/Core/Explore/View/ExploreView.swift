//
//  ExploreView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-06.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var exploreViewModel = ExploreViewModel(service: ExploreService())
    @State private var showMapView = false
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(viewModel: exploreViewModel, show: $showDestinationSearchView)
            } else {
                SearchAndFilterBar(location: $exploreViewModel.searchText)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showDestinationSearchView.toggle()
                        }
                    }
                ZStack(alignment : .bottom) {
                    ScrollView {
                        LazyVStack(spacing: 50) {
                            ForEach (exploreViewModel.listings) {
                                listing in
                                NavigationLink(value: listing) {
                                    ListingItem(listing: listing)
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                    .navigationDestination(for: Listing.self) {
                        listing in
                        ListingDetailView(listing : listing)
                            .navigationBarBackButtonHidden()
                    }
                    Button {
                        showMapView.toggle()
                    } label: {
                        HStack {
                            Text("Map")
                            Image(systemName: "map.fill")
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(.black)
                        .clipShape(Capsule())
                        .padding()

                    }
                }
                .sheet(isPresented: $showMapView) {
                    ListingMapView(listings: exploreViewModel.listings)
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
