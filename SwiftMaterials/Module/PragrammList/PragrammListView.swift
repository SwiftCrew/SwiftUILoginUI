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
                Text(list.name)
            } else {
                NavigationLink {
                    ListVeiw()
                } label: {
                    Text(list.name)
                }
            }
        }.onTapGesture(perform: {
            tabbedScreen = true
        })
        .listStyle(.plain)
        .navigationTitle("Programm List")

    }
}

#Preview {
    PragrammListView()
}
