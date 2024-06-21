//
//  RegisterView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subTitle: "Start Organizing todos",
                angle: -15,
                backgroundColor: .orange
            )

            Form {

                if !viewModel.errorMessage.isEmpty {

                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                TextField("User Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()

                SecureField("Enter Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                MTButton(title: "Create Account", foreground: .white, background: .green, acton: {
                    // Register
                    viewModel.register()
                })
                .padding()
            }
            .loadingIndicator(viewModel.isLoading)
            .offset(y: -50)
        }
    }
}

#Preview {
    RegisterView()
}
