//
//  ProfileViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject {

    @Published var user: User? = nil

    init() {}

    func fetchUser() {

        guard let userId = Auth.auth().currentUser?.uid else {

            return 
        }

        fetchUser(byId: userId)
    }

    func fetchUser(byId id: String) {
        let db = Firestore.firestore()
        db.collection(FConstants.users).document(id).getDocument { (document, error) in
            DispatchQueue.main.async {
                if let document = document, document.exists {
                    self.user = try? document.data(as: User.self)
                } else {
                    print("Document does not exist or error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }

    func logOut() {
        do {
            try Auth.auth().signOut()
            
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
