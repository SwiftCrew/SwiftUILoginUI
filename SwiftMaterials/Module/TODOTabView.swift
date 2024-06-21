//
//  TODOTabView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI

struct TODOTabView: View {
    var body: some View {
        TabView {
            ToDoListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    TODOTabView()
}
