//
//  LoginHeaderView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct HeaderView: View {

    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))

            VStack {
                Text(title)
                    .font(.system(size: 40))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 350
        )
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "SwiftUI To Do List",
        subTitle: "Get things done",
        angle: 15,
        backgroundColor: .blue
    )
}
