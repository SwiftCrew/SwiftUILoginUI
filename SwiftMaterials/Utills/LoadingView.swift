//
//  CustomLoader.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/06/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView: View {

    @Binding var isShowing: Bool
//    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

//                self.content()
//                    .disabled(self.isShowing)
//                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}

struct LoadingIndicator: ViewModifier {
    var isShowing: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                loadingView
            }
        }
    }

    private var loadingView: some View {
        GeometryReader { proxyReader in
            ZStack {
                Color.white.opacity(0.1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                ProgressView()
                    .progressViewStyle(
                        CircularProgressViewStyle(tint: .white)
                    )
                    .scaleEffect(x: 2, y: 2, anchor: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.black.opacity(0.7))
                            .frame(width: 80, height: 80)
                    )
                    .position(x: proxyReader.size.width/2, y: proxyReader.size.height/2)
            }
        }
        .ignoresSafeArea()
        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
    }
}

extension View {
    func loadingIndicator(_ isShowing: Bool) -> some View {
        self.modifier(LoadingIndicator(isShowing: isShowing))
    }
}

#Preview {
    LoadingView(isShowing: .constant(true))
}
