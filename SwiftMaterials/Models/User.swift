//
//  User.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/06/24.
//

import Foundation

struct User: Codable {
    var id: String = ""
    var name: String = ""
    var email: String
    var password: String
    var joined: TimeInterval = Date().timeIntervalSince1970
}
