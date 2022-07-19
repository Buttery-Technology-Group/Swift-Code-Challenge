//
//  UsersListComponent.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 18/07/22.
//

import SwiftUI

struct UsersListComponent: View {
    @ObservedObject private var coordinator = UsersListView.Coordinator()
    var body: some View {
        List {
            ForEach(self.coordinator.dataModel.people, id: \.self) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    HStack {
                        AsyncImage(url: URL(string: user.picture.thumbnail ?? ""))
                            .frame(width: 40, height: 40)
                            .scaledToFill()
                            .clipShape(Circle()).padding(.horizontal)
                        Text("\(user.name.first ?? "Luiz") \(user.name.last ?? "Mello")")
                    }
                }
                .navigationTitle("Users")
            }
            .onDelete(perform: removeRows)
            .onMove(perform: move)
        }
        .refreshable {
            await self.coordinator.refreshPeople()
        }
    }
    func move(from source: IndexSet, to destination: Int) {
        self.coordinator.dataModel.people.move(fromOffsets: source, toOffset: destination)
        self.coordinator.dataChanged.toggle()
    }
    
    func removeRows(at offsets: IndexSet) {
        self.coordinator.dataModel.people.remove(atOffsets: offsets)
        self.coordinator.dataChanged.toggle()
    }
}
