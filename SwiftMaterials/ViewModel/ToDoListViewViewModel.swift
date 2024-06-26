//
//  ToDoListViewViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation
import Firebase

class ToDoListViewModel: ObservableObject {

    @Published var showingNewItemView = false
    @Published var list: [ToDoListItem] = []
    @Published var showError = false
    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func updatetoggle(item: ToDoListItem) {

    }

    func deleteItem(item: ToDoListItem) {
        let db = Firestore.firestore()
        db.collection(FConstants.users)
            .document(userId)
            .collection(FConstants.todos)
            .document(item.id)
            .delete()
    }
}
