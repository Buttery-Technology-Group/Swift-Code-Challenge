//
//  UsersListViewModel.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import Foundation

class UsersListViewModel: ObservableObject {
    @Published var personList: [Person] = []
    
    init() {
        getPersonList()
    }
    
    func getPersonList() {
        let apiRequest = ApiRequesUser()
        
        apiRequest.requestApi { users in
            self.personList = users
        }
    }
}
