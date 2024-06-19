//
//  CircularImage.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct CircleImage: View {
    
    let player: Player
    var body: some View {

        AsyncImage(
            url: URL(string: player.pictureUrl)
        ) { image in
            image
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } placeholder: {
            ProgressView()
        }
    }
}


#Preview {
    CircleImage(player: Player.init(id: "1", name: "Rohit", role: "Bat", battingStyle: "Right", pictureUrl: "https://www.jagranimages.com/images/20_09_2019-virat_kohli_19596025.jpg"))
}
