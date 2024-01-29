//
//  WishlistLoginView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-29.
//

import SwiftUI

struct WishlistLoginView: View {
    @Binding var showLoginView : Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 4)
            {
                Text("Log in to view your wishlists")
                    .font(.headline)
                Text("You can create, view or edit wishlists once you've logged in")
                    .font(.footnote)
            }
            Button {
                showLoginView.toggle()
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WishlistLoginView(showLoginView: .constant(false))
}
