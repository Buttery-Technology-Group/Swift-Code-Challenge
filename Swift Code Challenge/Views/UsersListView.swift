//
//  UsersListView.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//
import SwiftUI
import Combine
struct UsersListView: View {
    @ObservedObject private var coordinator = Self.Coordinator()
    var body: some View {
        ZStack {
            NavigationView {
                if (self.coordinator.dataModel.people.isEmpty) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    UsersListComponent()
                        .toolbar {
                            EditButton()
                        }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

extension UsersListView {
    @MainActor
    final class Coordinator: ObservableObject {
        @Published var dataModel = DataModel()
        @Published var fetchService = FetchService()
        @Published var dataChanged: Bool = false
        init() {
            Task(priority: .userInitiated) {
                do {
                    let newPeople = try await self.fetchService.refreshPeople()
                    self.dataModel.people = newPeople
                    self.dataChanged.toggle()
                } catch {
                    print(error)
                }
            }
        }
        func refreshPeople() async {
            Task {
                if let newPeople = try? await self.fetchService.refreshPeople() {
                    self.dataModel.people = newPeople
                    self.dataChanged.toggle()
                }
            }
        }
    }
    final class DataModel: ObservableObject {
        @Published var people = [Person]()
    }
    actor FetchService {
        func refreshPeople() async throws -> [Person] {
            return try await self.refreshPeopleFromAPI()
        }
        func refreshPeopleFromAPI() async throws -> [Person] {
            guard let url = URL(string: "https://randomuser.me/api/?results=100") else { return [] }
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(PeopleResponse.self, from: data).results
        }
    }
}
