//
//  RegisterViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var success: Bool = false
    @Published var isLoading = false

    
    func register() {
        guard validation() else {

            return
        }
        isLoading = true
        let user = User(name: name, email: email, password: password)
        FirebaseManager.shared.register(user: user) { [weak self] isSuccess in
            self?.isLoading = false
            guard let weakSelf = self, isSuccess else {
                debugPrint("firebase login failed")
                self?.success = false
                return
            }
            debugPrint("firebase login success")
            weakSelf.success = true
        }
    }

    func validation() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {

            errorMessage = "Please enter a valid email."
            return false
        }

        return true
    }

}
