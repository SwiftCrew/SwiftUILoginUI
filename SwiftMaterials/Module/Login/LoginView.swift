//
//  LoginView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()

    var body: some View {

        NavigationStack {
            // Header
            HeaderView(
                title: "SwiftUI To Do List",
                subTitle: "Get things done",
                angle: 15,
                backgroundColor: .pink
            )

            // Login Form
            Form {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()

                SecureField("Enter Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                MTButton(
                    title: "Log In",
                    foreground: .white,
                    background: .blue,
                    acton: {
                    viewModel.login()
                })
                .padding()
            }.navigationDestination(
                isPresented: $viewModel.success,
                destination: {
                    ListVeiw()
                }
            )
            .offset(y: -50)
            VStack {
                Text("New around here?")
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Create An Account")
                }
            }
            .padding(.bottom,  50)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
