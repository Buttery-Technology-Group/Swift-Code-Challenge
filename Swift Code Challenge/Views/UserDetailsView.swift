//
//  UserDetailsView.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//

import SwiftUI
import MessageUI

struct UserDetailsView: View {
    @State var user: Person
    var body: some View {
        VStack{
            MapView(lat: user.lat, long: user.long)
                .frame(height: 200)
                .ignoresSafeArea(edges: .top)
            VStack{
                CircleImage(userImage: user.photo)
                
                contentBody(user: user)
            }
            .offset(y: -200)
            .padding(.bottom, -130)
            
            Spacer()
            
            Text("made by @luizmello.dev - click me!")
                .onTapGesture {
                    openInstagram(instagramHandle: "luizmello.dev")
                }
                .padding(.vertical)
            
            
        }
    }
    func openInstagram(instagramHandle: String) {
        guard let url = URL(string: "https://instagram.com/\(instagramHandle)")  else { return }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: Person(id: "12312", firstName: "Luiz", lastName: "Mello", photoThumb: "https://randomuser.me/api/portraits/men/75.jpg", photo: "https://randomuser.me/api/portraits/men/75.jpg", email: "contato@luizmello.dev", phonenNumber: "999999999", address: "Ferreira Viana", lat: "40.066572", long: "-76.339166", city: "Porto Alegre", country: "Brazil"))
    }
}

struct contentBody: View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    var user: Person
    
    var body: some View {
        VStack(spacing: 5) {
            Text("\(user.firstName) \(user.lastName)")
                .bold()
                .font(.title)
            HStack() {
                Text("\(user.address),")
                    .font(.body)
                    .foregroundColor(.secondary)
                Text("\(user.city) - \(user.country)")
                    .font(.body)
                    .bold()
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 70)
            
            Button(action: {
                let tel = "mailto:"
                var formattedString = tel + user.email
                let url: NSURL = URL(string: formattedString)! as NSURL
                
                UIApplication.shared.open(url as URL)}) {
                    HStack {
                        Image(systemName: "mail")
                            .font(.body)
                        Text(user.email)
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
                .padding()
            
            Button(action: {
                
                // validation of phone number not included
                let dash = CharacterSet(charactersIn: "-")
                
                let cleanString =
                user.phonenNumber.trimmingCharacters(in: dash)
                
                let tel = "tel://"
                var formattedString = tel + cleanString
                let url: NSURL = URL(string: formattedString)! as NSURL
                
                UIApplication.shared.open(url as URL)
            }) {
                HStack {
                    Image(systemName: "phone")
                        .font(.body)
                    Text(user.phonenNumber)
                        .fontWeight(.semibold)
                        .font(.body)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.cyan)
                .cornerRadius(40)
            }
        }
    }
}



