//
//  FirebaseManager.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/06/24.
//

import Foundation
import Firebase
import FirebaseAuth

typealias UserCompletion = (Bool) -> Void
typealias ToDoListsCompletion = ([ToDoListItem]?, Error?) -> Void
enum FConstants {
    static let users = "users"
    static let todos = "todos"
}

class FirebaseManager {


    static var shared = FirebaseManager()

    private let db = Firestore.firestore()

    private init() { }

    var isSignedIn: Bool {

        return Auth.auth().currentUser != nil
    }

    var currentLoggeduId: String {

        return Auth.auth().currentUser?.uid ?? ""
    }

    func fetchToDoList(
        id: String,
        completion: @escaping ToDoListsCompletion
    ) {
        let path = "\(FConstants.users)/\(currentLoggeduId)/\(FConstants.todos)"
        db.collection(path).getDocuments { snapshot, error in
            if let unwrapError = error {

                debugPrint("unwrapError", unwrapError)
                completion(nil, unwrapError)
            } else {
                let item: [ToDoListItem] = snapshot?.documents.compactMap { document -> ToDoListItem? in
                    try? document.data(as: ToDoListItem.self)
                } ?? []
                debugPrint("item", item)
                completion(item, nil)
            }
        }
    }

    func login(user: User, completion: @escaping UserCompletion) {

        Auth.auth().signIn(
            withEmail: user.email, password: user.password
        ) { [weak self] result, error in

            guard let weakSelf = self, let userId = result?.user.uid else {
                completion(false)
                return
            }
            debugPrint("weakSelf", weakSelf, userId)
            completion(true)
        }
    }

    func register(user: User, completion: @escaping UserCompletion) {

        Auth.auth().createUser(
            withEmail: user.email,
            password: user.password
        ) { [weak self] result, error in

            guard let weakSelf = self, let userId = result?.user.uid else {
                completion(false)
                return
            }
            var userObject = user
            userObject.joined = Date().timeIntervalSince1970
            userObject.id = userId
            weakSelf.insertUserRecord(user: userObject)
            completion(true)
        }
    }

    func insertUserRecord(user: User) {

        db.collection(FConstants.users)
            .document(user.id)
            .setData(user.toDictionary)
    }

    func insertToDoCollection(model: ToDoListItem) {

        db.collection(FConstants.users)
            .document(currentLoggeduId)
            .collection(FConstants.todos)
            .document(model.id)
            .setData(model.toDictionary)
    }

    func deleteItem(model: ToDoListItem) {
        db.collection(FConstants.users)
            .document(currentLoggeduId)
            .collection(FConstants.todos)
            .document(model.id)
            .delete()
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
