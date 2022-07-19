//
//  UserModel.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import Foundation

struct PeopleResponse: Codable {
    let results: [Person]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}


struct ID: Equatable, Hashable, Decodable, Encodable {
    let value: String?
}

struct Name: Equatable, Decodable, Hashable, Encodable {
    let first: String?
    let last: String?
}

struct Picture: Equatable, Decodable, Hashable, Encodable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}

struct coordinates: Equatable, Decodable, Hashable, Encodable {
    let latitude: String?
    let longitude: String?
}

struct location: Equatable, Decodable, Hashable, Encodable {
    let street: street?
    let city: String?
    let state: String?
    let country: String?
    let coordinates: coordinates?
}

struct street: Equatable, Decodable, Encodable, Hashable {
    let number: Int?
    let name: String?
}


struct Person: Identifiable, Equatable, Decodable, Encodable, Hashable {
    let id: ID
    let name: Name
    let picture: Picture
    let email: String
    let phone: String
    let location: location
    
}
