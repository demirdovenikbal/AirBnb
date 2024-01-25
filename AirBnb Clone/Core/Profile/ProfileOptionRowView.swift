//
//  ProfileOptionRowView.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-13.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName : String
    let title : String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "settings")
}
