//
//  MTButton.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct MTButton: View {

    let title: String
    let foreground: Color
    let background: Color
    let acton: () -> Void

    var body: some View {
        Button {
            acton()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(foreground)
                    .bold()
            }
        }
    }
}

#Preview {
    MTButton(title: "Log In", foreground: .white, background: .blue, acton: {
        // action
    })
}
