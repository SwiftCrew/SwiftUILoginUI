//
//  ProgressBarView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 04/07/24.
//

import SwiftUI

struct ProgressBarView: View {

    @State var percent: CGFloat = 0
    var body: some View {

        VStack(spacing: 50) {
            Text("\(Int(percent))%")
                .font(.headline)
                .frame(height: 40)

            MTProgressBar(
                width: 200,
                height: 20,
                percent: percent,
                color1: .blue,
                color2: .red
            )

            .padding()

            Button(action: {
                percent = CGFloat.random(in: 0...100)
            }, label: {
                Text("Generate Random Number")
            })
            .padding()
        }
    }
}

#Preview {
    ProgressBarView()
}
