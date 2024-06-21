//
//  ProgrammList.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import Foundation

struct ProgrammList: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let name : String
    let type: Screen 
}
