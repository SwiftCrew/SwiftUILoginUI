//
//  ListVeiw.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 18/06/24.
//

import SwiftUI

struct ListVeiw: View {
    @StateObject private var viewModel = PlayerViewModel()

    var body: some View {
        List(viewModel.players, id: \.id) { player in
            NavigationLink {

                DetailView(player: player)
            } label: {
                PlayerListCell(player: player)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Indian Cricket Team")
    }
}

struct PlayerListCell: View {
    let player: Player

    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: player.pictureUrl)
            ) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(player.name)
                    .font(.headline)
                Text(player.role)
                    .font(.subheadline)
                Text(player.battingStyle)
                    .font(.subheadline)
                if let bowlingStyle = player.bowlingStyle {
                    Text(bowlingStyle)
                        .font(.subheadline)
                }
            }
        }
    }
}
#Preview {
    ListVeiw()
}
