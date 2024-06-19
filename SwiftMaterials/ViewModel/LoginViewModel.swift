//
//  LoginViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var email: String = "a@w.com"
    @Published var password: String = "assdsda"
    @Published var errorMessage: String = ""
    @Published var success: Bool = false

    init() {}

    func login() {

        guard validation() else {
            return
        }

        success = true
        print("Called")
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
