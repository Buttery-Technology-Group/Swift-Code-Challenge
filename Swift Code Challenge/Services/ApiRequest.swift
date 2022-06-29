//
//  ApiRequest.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import Foundation

// API Settings

struct ApiRequesUser{
    func requestApi(completionHandler: @escaping ([Person]) -> Void){
        let urlString = "https://randomuser.me/api/?results=10"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            typealias justPerson = [String: Any]
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let dictionaryPerson = dictionary["results"] as? [justPerson]
                    
            else{
                completionHandler([])
                return
            }
            
            var localPerson: [Person] = []
            
            print(localPerson)
            // parsing
            for personDict in dictionaryPerson{
                let email = personDict["email"] as? String ?? ""
                let phoneNumber = personDict["phone"] as? String ?? ""
                let location = personDict["location"] as? [String: Any] ?? [:]
                let coordinates = location["coordinates"] as? [String: Any] ?? [:]
                let lat = coordinates["latitude"] as? String ?? ""
                let long = coordinates["longitude"] as? String ?? ""
                let street = location["street"] as? [String: Any] ?? [:]
                let nameStreet = street["name"] as? String ?? ""
                let city = location["city"] as? String ?? ""
                let country = location["country"] as? String ?? ""
                let id = personDict["id"] as? [String: Any] ?? [:]
                let name = personDict["name"] as? [String: Any] ?? [:]
                let firstName = name["first"] as? String ?? ""
                let lastName = name["last"] as? String ?? ""
                let picture = personDict["picture"] as? [String: Any] ?? [:]
                let thumbnail = picture["thumbnail"] as? String ?? ""
                let mediumPhoto = picture["large"] as? String ?? ""
                let idValue = id["value"] as? String ?? ""
                let person = Person(id: idValue, firstName: firstName, lastName: lastName, photoThumb: thumbnail, photo: mediumPhoto, email: email, phonenNumber: phoneNumber, address: nameStreet, lat: lat, long: long, city: city, country: country)
                
                
                localPerson.append(person)
            }
            completionHandler(localPerson)
        }
        .resume()
    }
}


