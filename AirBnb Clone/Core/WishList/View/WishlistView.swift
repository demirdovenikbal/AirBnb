//
//  WishlistView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-13.
//

import SwiftUI

struct WishlistView: View {
    @State private var showLoginView = false
    @ObservedObject var authManager : AuthManager
    init(authManager : AuthManager) {
        self.authManager = authManager
        
    }
    var body: some View {
        NavigationStack {
            VStack {
                if authManager.userSessionId == nil {
                    WishlistLoginView(showLoginView: $showLoginView)
                } else {
                    EmptyWishlistView()
                }
            }
            .padding()
            .navigationTitle("Wishlists")
        }
        .sheet(isPresented: $showLoginView, content: {
            LoginView(authManager: authManager)
                .presentationDragIndicator(.visible)
        })
    }
}

#Preview {
    WishlistView(authManager: AuthManager(service: FirebaseAuthService()))
}
