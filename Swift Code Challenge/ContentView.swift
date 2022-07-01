//
//  ContentView.swift
//  Swift Code Challenge
//
//  Created by Jonathan Holland on 6/26/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: UsersListViewModelAsync = UsersListViewModelAsync()
    
    var body: some View {
        UsersListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
