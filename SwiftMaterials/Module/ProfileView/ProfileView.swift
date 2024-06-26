//
//  ProfileView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @AppStorage("tabbedScreen") private var tabbedScreen: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(
                    title: "Profile",
                    subTitle: "Here is Profile Details",
                    angle: 15,
                    backgroundColor: .green
                )

                if let user = viewModel.user {

                    profile(user: user)
                        .offset(y: -110)
                } else {
                    Text("Loading profile....")
                }
            }
        }.onAppear {
            self.viewModel.fetchUser()
        }
    }

    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()

        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()

            HStack {
                Text("Member Since: ")
                    .bold()
                Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
            }
            .padding()
        }.padding()

        Button("LogOut") {
            viewModel.logOut()
            tabbedScreen = false
        }
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView()
}
