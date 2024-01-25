//
//  ExploreViewModel.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-16.
//

import Foundation

@MainActor
class ExploreViewModel : ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchText = ""
    private var listingsCopy = [Listing]()
    private let service : ExploreService
    init(service : ExploreService) {
        self.service = service
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await ExploreService().fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG : Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchText.lowercased() || $0.state.lowercased() == searchText.lowercased()
        })
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
