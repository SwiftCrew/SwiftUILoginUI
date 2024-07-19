//
//  TransitionAniamtion.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 16/07/24.
//

import SwiftUI

struct AnimatedExampleView: View {
    // Variable to trigger the animated transition
    @State var isExpanded: Bool = true

    var body: some View {
        VStack {
            if isExpanded {
                smallSizeView()
            } else {
                largeSizeView()
            }
        }
        .padding()
        // On tap the transition is triggered
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }

    @ViewBuilder
    func smallSizeView() -> some View {
        // Initial state of the view
        RoundedRectangle(cornerRadius: 25)
            .fill(.black)
            .frame(width: 300,height: 300)
            .overlay {
                Text("Hello Developer")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }

    @ViewBuilder
    func largeSizeView() -> some View {
        // Final state of the view
        RoundedRectangle(cornerRadius: 25)
            .fill(.black)
            .overlay {
                Text("Hello Developer")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    AnimatedExampleView()
}
