//
//  ListVeiw.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 18/06/24.
//

import SwiftUI

struct DetailView: View {

    let player: Player

    var body: some View {
        VStack(alignment: .center, content: {
            RectangleImage(player: player)
                .frame(height: 350)
                        CircleImage(player: player)
                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
                .offset(y: -110)
            PlayerDetailsCell(player: player)
                .frame(height: 70)
                .offset(y: -100)
            Spacer()
        })
        .navigationTitle(player.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlayerDetailsCell: View {

    let player: Player

    var body: some View {
        VStack(alignment: .leading) {
            Text(player.name)
                .font(.title)
            HStack {
                Text(player.role)
                    .font(.subheadline)
                Spacer()
                Text(player.battingStyle)
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(player: Player.init(id: "1", name: "Rohit", role: "Bat", battingStyle: "Right", pictureUrl: "https://img.jagranjosh.com/images/2024/May/252024/rohit-sharma.jpg"))
}

