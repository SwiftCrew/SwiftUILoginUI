//
//  NewItemViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation

class NewItemViewModel: ObservableObject {

    @Published var title = ""
    @Published var dueDate = Date()

    init(){}

    func save() {
        
    }
}
