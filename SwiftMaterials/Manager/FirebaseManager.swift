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

class FirebaseManager {

    enum Constants {
        static let users = "users"
    }

    static var shared = FirebaseManager()

    private let db = Firestore.firestore()

    private init() { }

    var isSignedIn: Bool {

        return Auth.auth().currentUser != nil
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

        db.collection(Constants.users)
            .document(user.id)
            .setData(user.toDictionary)

    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
