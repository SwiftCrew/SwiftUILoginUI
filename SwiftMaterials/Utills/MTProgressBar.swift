//
//  MTProgressBar.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 04/07/24.
//

import SwiftUI

struct MTProgressBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 76
    var color1 = Color(.red)
    var color2 = Color(.yellow)

    var body: some View {
        let multiplier = width / 100
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))

            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background (
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }
}

#Preview {
    MTProgressBar()
}
