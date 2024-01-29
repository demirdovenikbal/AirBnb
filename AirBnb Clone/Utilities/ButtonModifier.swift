//
//  LoginButtonModifier.swift
//  AirBnb Clone
//
//  Created by Ikbal Demirdoven on 2024-01-28.
//

import Foundation
import SwiftUI

struct LoginButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
