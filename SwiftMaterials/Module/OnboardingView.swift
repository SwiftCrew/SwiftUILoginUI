//
//  OnboardingView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/07/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {

        TabView {
            OnboardView(systemImageName: "scribble.variable", title: "Sketchpad", desc: "Definition and Usage. The longdesc attribute specifies a hyperlink to a detailed description of an image.")
            OnboardView(systemImageName: "paintpalette.fill", title: "Traio", desc: "Long description is just as it sounds – a long description of an image. When images are complex, simple alternative text is not enough. This is especially common in instructional content that students are expected to learn from, such as diagrams, charts, and graphs.")
            OnboardView(systemImageName: "dial.min.fill", title: "Custom Settong", desc: "The LONGDESC attribute links to a file that contains only the descriptive information relating to the image. It can be any length necessary to accurately convey meaning.")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}

struct OnboardView: View {

    let systemImageName: String
    let title: String
    let desc: String

    var body: some View {

        VStack(spacing: 20) {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.teal)

            Text(title)
                .font(.title.bold())

            Text(desc)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 40)
    }
}
