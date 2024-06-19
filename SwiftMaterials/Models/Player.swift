//
//  Player.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import Foundation
import Foundation

struct Player: Identifiable, Codable {
    var id: String
    var name: String
    var role: String
    var battingStyle: String
    var bowlingStyle: String?
    var pictureUrl: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case role = "role"
        case battingStyle = "batting_style"
        case bowlingStyle = "bowling_style"
        case pictureUrl = "picture_url"
    }
}

struct Team: Codable {
    var captain: String
    var players: [Player]

    private enum CodingKeys: String, CodingKey {
        case captain = "Captain"
        case players = "Players"
    }
}
