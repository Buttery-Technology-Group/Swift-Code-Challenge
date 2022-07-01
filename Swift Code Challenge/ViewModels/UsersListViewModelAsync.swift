//
//  UsersListViewModelAsync.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//
import Foundation
import SwiftUI

class UsersListViewModelAsync: ObservableObject {
    @Published var personList: [Person] = []
    
    init() {
        getPersonList()
    }
    
    func getPersonList() {
        Task {
            do {
                let requestApi = try await ApiRequestAsync.fetchUser()
                
                DispatchQueue.main.async {
                    self.personList = requestApi
                }
            } catch {
                print(error)
            }
        }
    }
}




