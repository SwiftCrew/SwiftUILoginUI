//
//  LinearLoaderView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 30/07/24.
//

import SwiftUI

struct LinearLoaderView: View {

    var foregroundColor: Color
    var backgroundColor: Color
    var height: CGFloat
    @State private var animate = false

    var body: some View {
        GeometryReader(content: { geometry in
            let width = geometry.size.width
            let lineWidth = width/2

            Capsule()
                .fill(backgroundColor)
                .frame(width: width)
                .overlay {
                    Capsule()
                        .fill(foregroundColor)
                        .frame(width: lineWidth)
                        .offset(x: animate ? -lineWidth : lineWidth)
                        .animation(.easeOut(duration: 0.85).repeatForever(), value: animate)
                }
        })
        .frame(height: height)
        .clipShape(Capsule())
        .onAppear(perform: {
            animate.toggle()
        })
    }
}

#Preview {
    LinearLoaderView(foregroundColor: .orange, backgroundColor: .blue, height: 5)
}
