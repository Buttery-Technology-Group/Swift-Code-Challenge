//
//  TestAsync.swift
//  Swift Code Challenge
//
//  Created by Luiz Eduardo Mello dos Reis on 30/06/22.
//

import SwiftUI

struct TestAsync: View {
    @StateObject var viewModel: UsersListViewModelAsync
    
    
    var body: some View {
        if(viewModel.personList.isEmpty){
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        else{
            List{
                ForEach(Array(zip(viewModel.personList.indices, viewModel.personList)), id: \.0) {index, user in
                    Text(user.name.first ?? "Luiz")
                }
            }
        }
        
    }
}
