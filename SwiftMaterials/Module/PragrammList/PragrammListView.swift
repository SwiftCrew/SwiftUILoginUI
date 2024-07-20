//
//  PragrammList.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI

struct PragrammListView: View {
    @StateObject var viewModel = PragrammListViewModel()
    @AppStorage("tabbedScreen") private var tabbedScreen: Bool = false

    var body: some View {
        List(viewModel.list, id: \.id) { list in
            if list.type == .todoList {
                Text(list.name).onTapGesture {
                    tabbedScreen = true
                }
            } else {
                NavigationLink {
                    if list.type == .progressBar {
                        ProgressBarView()
                    } else if list.type == .transitionAnimation {
                        AnimatedExampleView()
                    } else if list.type == .promoCode {
                        PromoCodeView()
                    } else if list.type == .scrollViewWithAnimation {
                        ScrollViewAnimation()
                    } else if list.type == .musicPlayerViewLayout {
                        MusicPlayerViewLayout()
                    } else if list.type == .mapKitWithActionSheet {
                        MapView()
                    } else if list.type == .onboardingView {
                        OnboardingView()
                    } else {
                        ListVeiw()
                    }
                } label: {
                    Text(list.name)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Programm List")
    }
}

#Preview {
    PragrammListView()
}
