//
//  ExploreService.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-16.
//

import Foundation

class ExploreService : ObservableObject {
    func fetchListings() async throws -> [Listing] {
        return PreviewProvider().listings
    }
}
