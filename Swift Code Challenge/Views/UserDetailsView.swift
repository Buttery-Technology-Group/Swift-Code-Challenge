//
//  UserDetailsView.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//
import SwiftUI
struct UserDetailsView: View {
    @State var user: Person
    var body: some View {
        VStack {
            CircleImage(userImage: user.picture.large ?? "")
                .frame(width: 128, height: 128)
            contentBody(user: user)
        }
        Spacer()
    }
}
struct contentBody: View {
    var user: Person
    var body: some View {
        VStack(spacing: 5) {
            Text("\(user.name.first ?? "Luiz") \(user.name.last ?? "Mello")")
                .bold()
                .font(.title)
            HStack {
                Text("\(user.location.street?.name ?? "Street not found"),")
                    .font(.body)
                    .foregroundColor(.secondary)
                Text("\(user.location.city ?? "City not found") - \(user.location.country ?? "Country not found")")
                    .font(.body)
                    .bold()
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 70)
            Text("Email").bold()
            Text(user.email)
                .padding(.vertical, 10)
            Text("Phone number").bold()
            Text(user.phone)
        }
    }
}



