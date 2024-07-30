//
//  LoginLoader.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 30/07/24.
//

import SwiftUI

struct LoginLoader: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State var loginInProgress = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                titleView

                loginForm

                LinearLoaderView.init(
                    foregroundColor: .orange,
                    backgroundColor: .white,
                    height: 5
                )
                    .frame(width: 200)
                    .opacity(loginInProgress ? 1 : 0)
            }
        }
    }

    private var titleView: some View {

        HStack {
            Text("Swift")
                .foregroundStyle(.orange)
            RoundedRectangle(cornerRadius: 4)
                .fill(.orange)
                .frame(width: 45, height: 45)
                .overlay {
                    Text("in")
                        .foregroundStyle(.white)
                }
        }
        .font(.largeTitle)
        .bold()
    }

    private var loginForm: some View {

        VStack {
            Group {
                TextField("", text: $userName, prompt: Text("Enter a username").font(.caption).foregroundStyle(.white))
                SecureField("", text: $password, prompt: Text("Enter a password").font(.caption).foregroundStyle(.white))
            }
            Button(action: {

                loginInProgress.toggle()
            }, label: {
                Text("Log In")
                    .foregroundStyle(.white)
                    .frame(width: 200)
            })
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .disabled(loginInProgress)
        }
        .font(.title3)
        .frame(width: 200)
        .padding(.vertical, 20)

    }
}

#Preview {
    LoginLoader()
}
