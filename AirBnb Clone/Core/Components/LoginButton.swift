//
//  LoginButto .swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-13.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Login!")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.subheadline)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    LoginButton()
}
