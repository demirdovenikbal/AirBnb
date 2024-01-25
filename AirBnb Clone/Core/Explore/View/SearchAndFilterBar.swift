//
//  SearchAndFilterBar.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-06.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location : String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .bold()
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere - " : "")Any week - Add guests")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.5), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location : .constant("Los Angeles"))
}
