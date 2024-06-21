//
//  ToDoListView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()

    var body: some View {
        NavigationStack {
            VStack {

            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView()
            })
        }
    }
}

#Preview {
    ToDoListView()
}
