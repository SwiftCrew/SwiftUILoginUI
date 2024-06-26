//
//  ToDoListView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {

    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userId: String

    init(userId: String) {

        debugPrint("userId", userId)
        self.userId = userId
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
        let path = "\(FConstants.users)/\(userId)/\(FConstants.todos)"
        self._items = FirestoreQuery(collectionPath: path)
    }

    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteItem(item: item)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "O1O5wVfjrBZl0atXtPWx1VAAE772")
}
