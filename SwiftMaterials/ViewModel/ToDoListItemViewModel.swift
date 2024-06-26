//
//  ToDoListItemViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 26/06/24.
//

import Foundation
import Firebase

class ToDoListItemViewModel: ObservableObject {
    init() {}

    func toggleIsDone(item: ToDoListItem) {
        var copyItem = item
        copyItem.setDone(!item.isDone)

        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        db.collection(FConstants.users)
            .document(uid)
            .collection(FConstants.todos)
            .document(copyItem.id)
            .setData(copyItem.toDictionary)
    }
}
