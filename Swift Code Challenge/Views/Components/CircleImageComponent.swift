//
//  CircleImageComponent.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//

import SwiftUI

struct CircleImage: View {
    var userImage: String
    var body: some View {
        AsyncImage(url: URL(string: userImage))
            .aspectRatio(contentMode: .fit)
            .frame(width: 128, height: 128)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
    }
}
