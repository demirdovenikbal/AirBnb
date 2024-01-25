//
//  Listing.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-14.
//

import Foundation
import CoreLocation

struct Listing : Identifiable, Codable, Hashable {
    let id : String
    
    //owner
    let ownerUid : String
    let ownerName : String
    let ownerImageUrl : String
    
    //listing
    let imageURLs : [String]
    let numberOfBedrooms : Int
    let numberOfBathrooms : Int
    let numberOfGuests : Int
    let numberOfBeds : Int
    var pricePerNight : Int
    var reviews : Int
    
    //address
    
    let address : String
    let city : String
    let state : String
    
    //listing features
    let title : String
    var rating : Double
    var features : [ListingFeatures]
    var amenities : [ListingAmenities]
    let type : ListingType
    
    //coordinates
    let latitude : Double
    let longitude : Double
    var location : CLLocationCoordinate2D {
        return .init(latitude: latitude, longitude: longitude)
    }
}

enum ListingFeatures : Int, Codable, Hashable, Identifiable {
    case selfCheckIn
    case superHost
    
    var id : Int { return self.rawValue }
    
    var title : String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var imageName : String {
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    var subTitle : String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad"
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are committed to provide great stars for guests"
        }
    }
}

enum ListingAmenities : Int, Codable, Hashable, Identifiable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id : Int { return self.rawValue }
    
    var title : String {
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var imageName : String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        }
    }
    
}

enum ListingType : Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description : String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
    
    var id : Int { return self.rawValue }
}
