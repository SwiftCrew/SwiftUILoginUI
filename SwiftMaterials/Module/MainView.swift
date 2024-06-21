//
//  ContentView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 18/06/24.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewModel()
    @AppStorage("tabbedScreen") private var tabbedScreen: Bool = false

    var body: some View {
        if tabbedScreen {

            TODOTabView()

        } else {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                NavigationStack {
                    PragrammListView()
                }
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
