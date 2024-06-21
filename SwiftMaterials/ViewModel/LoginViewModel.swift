//
//  LoginViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email: String = "test2@mail.com"
    @Published var password: String = "Test@123"
    @Published var errorMessage: String = ""
    @Published var success: Bool = false
    @Published var isLoading = false

    init() {}

    func login() {

        guard validation() else {
            return
        }

        self.isLoading = true
        let user = User(email: email, password: password)

        FirebaseManager.shared.login(user: user) { [weak self] isSuccess in
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
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
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
