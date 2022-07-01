//
//  UserModel.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import Foundation

struct ID: Equatable, Hashable, Decodable {
    let value: String?
}

struct Name: Equatable, Decodable {
    let first: String?
    let last: String?
}

struct Picture: Equatable, Decodable{
    let large: String?
    let medium: String?
    let thumbnail: String?
}

struct coordinates: Equatable, Decodable{
    let latitude: String?
    let longitude: String?
}

struct location: Equatable, Decodable{
    let street: street?
    let city: String?
    let state: String?
    let country: String?
    let coordinates: coordinates?
}

struct street: Equatable, Decodable{
    let number: Int?
    let name: String?
}


struct Person: Identifiable, Equatable, Decodable {
    let id: ID
    let name: Name
    let picture: Picture
    let email: String
    let phone: String
    let location: location
    
}
