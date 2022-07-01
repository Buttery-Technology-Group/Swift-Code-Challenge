//
//  UsersListView.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel: UsersListViewModelAsync = UsersListViewModelAsync()
    @State private var showDevice = false
    @State private var selection: Person? = nil
    
    
    var body: some View {
        ZStack{
            NavigationView{
                if(viewModel.personList.isEmpty){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                else{
                    VStack{
                        ListComponent(viewModel: viewModel)
                        
                        NewUsersButton(viewModel: viewModel)
                    }
                    .toolbar {
                        EditButton()
                    }
                }
            } .navigationViewStyle(StackNavigationViewStyle())
            if showDevice {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea()
                VStack{
                    Text("Real Device")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Text("Use it on real device to best experience")
                        .foregroundColor(.white)
                        .font(.body)
                }
            }
        }
        .onAppear(){
            self.showDevice = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showDevice = false
            }
        }
    }
}

struct ListComponent: View{
    @ObservedObject var viewModel: UsersListViewModelAsync
    
    var body: some View{
        List{
            ForEach(Array(zip(viewModel.personList.indices, viewModel.personList)), id: \.0) {index, user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    HStack{
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
            viewModel.getPersonList()
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        viewModel.personList.move(fromOffsets: source, toOffset: destination)
    }
    
    func removeRows(at offsets: IndexSet) {
        viewModel.personList.remove(atOffsets: offsets)
    }
}

struct NewUsersButton: View{
    @ObservedObject var viewModel: UsersListViewModelAsync
    var body: some View{
        Button {
            viewModel.getPersonList()
        } label: {
            Group{
                HStack {
                    Image(systemName: "person.3.sequence.fill")
                        .font(.body)
                    Text("Update for new users")
                        .fontWeight(.semibold)
                        .font(.body)
                }
            }
            .padding(.vertical)
        }
    }
}
