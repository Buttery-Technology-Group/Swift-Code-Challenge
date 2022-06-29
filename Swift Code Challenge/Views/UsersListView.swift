//
//  UsersListView.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 29/06/22.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var viewModel: UsersListViewModel = UsersListViewModel()
    
    
    var body: some View {
        NavigationView{
            if(viewModel.personList.isEmpty){
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            else{
                List{
                    ForEach(Array(zip(viewModel.personList.indices, viewModel.personList)), id: \.0) {index, user in
                        HStack{
                            Text("teste")
                            Text("\(user.firstName) \(user.lastName)")
                            
                        }
                        
                    }
                }
            }
            
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
