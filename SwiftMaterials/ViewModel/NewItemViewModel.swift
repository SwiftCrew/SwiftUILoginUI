//
//  NewItemViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation
import Firebase

class NewItemViewModel: ObservableObject {

    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init(){}

    func save() {

        guard canSave else {
            showAlert = true
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else {
            showAlert = true
            return
        }

        let item  = ToDoListItem(
            id: UUID().uuidString,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )

        let db = Firestore.firestore()
        db.collection(FConstants.users)
            .document(uid)
            .collection(FConstants.todos)
            .document(item.id)
            .setData(item.toDictionary)
    }

    var canSave: Bool {

        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {

            return false
        }

        guard dueDate >= Date().addingTimeInterval(-86400) else {

            return false
        }

        return true
    }
}
