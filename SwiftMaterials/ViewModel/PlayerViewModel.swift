//
//  PlayerViewModel.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published var players: [Player] = []

    init() {
        loadPlayers()
    }

    func loadPlayers() {
        guard let url = Bundle.main.url(forResource: "players", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let team = try JSONDecoder().decode(Team.self, from: data)
            self.players = team.players
        } catch {
            print("Failed to load JSON data: \(error.localizedDescription)")
        }
    }
}
