//
//  ApiRequestAsync.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//

import Foundation

class ApiRequestAsync {
    
    static func fetchUser() async throws -> [Person] {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else { return [] }
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        struct Response: Decodable {
            let results: [Person]
        }
        
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response.results
        //filter { $0.id.value != nil}
    }
}
