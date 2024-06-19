//
//  RegisterView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct RegisterView: View {

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subTitle: "Start Organizing todos",
                angle: -15,
                backgroundColor: .orange
            )

            Form {
                TextField("User Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()

                SecureField("Enter Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())

                MTButton(title: "Create Account", foreground: .white, background: .green, acton: {
                    // Login
                })
                .padding()
            }

            .offset(y: -50)
        }
    }
}

#Preview {
    RegisterView()
}
