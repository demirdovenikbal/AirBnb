//
//  AirBnb_CloneApp.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2023-12-23.
//

import SwiftUI

@main
struct AirBnb_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            DestinationSearchView(selectedOption: .dates, show: .constant(false))
        }
    }
}
