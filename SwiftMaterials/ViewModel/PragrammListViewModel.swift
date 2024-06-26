//
//  PragrammListViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation

class PragrammListViewModel: ObservableObject {


    @Published var list: [ProgrammList] = []

    init() {
        list = [
            ProgrammList(name: "Player List", type: .list),
            ProgrammList(name: "To Do List", type: .todoList)
        ]
    }
}
