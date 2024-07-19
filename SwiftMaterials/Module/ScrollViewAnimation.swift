//
//  ScrollViewAnimation.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/07/24.
//

import SwiftUI

struct ScrollViewAnimation: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(scrollMockData) { data in
                    Circle()
                        .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 1 : 4, spacing: 16)
                        .foregroundStyle(data.color)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

struct ScrollItem: Identifiable {
    let id = UUID()
    let color: Color
}

var scrollMockData: [ScrollItem] = [
    ScrollItem(color: .pink),
    ScrollItem(color: .teal),
    ScrollItem(color: .yellow),
    ScrollItem(color: .red),
    ScrollItem(color: .black),
    ScrollItem(color: .blue),
    ScrollItem(color: .green),
    ScrollItem(color: .orange),
    ScrollItem(color: .purple),
    ScrollItem(color: .cyan),
    ScrollItem(color: .black),
    ScrollItem(color: .blue),
    ScrollItem(color: .green),
    ScrollItem(color: .orange),
    ScrollItem(color: .purple),
    ScrollItem(color: .cyan),
    ScrollItem(color: .black),
    ScrollItem(color: .blue),
    ScrollItem(color: .green),
    ScrollItem(color: .orange),
    ScrollItem(color: .purple),
    ScrollItem(color: .cyan)
]

#Preview {
    ScrollViewAnimation()
}
