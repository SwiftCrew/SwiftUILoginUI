//
//  Extension.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/06/24.
//

import Foundation

extension Encodable {

    var toDictionary: [String: Any] {

        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }

        do {

            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {

            return [:]
        }
    }
}

import SwiftUI

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {

        EmptyView()
            .frame(width: 100, height: 100)
            .background(Color.red)
            .modifier(LoadingButtonModifier(size: .init(width: 20, height: 20), lineWidth: 2, background: .init(hex: ""), cornerRadius: 8, isLoading: .constant(true)))
    }
}

struct LoadingButtonModifier: ViewModifier {
    let size: CGSize
    let lineWidth: CGFloat 
    let background: Color
    let cornerRadius: CGFloat

    @Binding var isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .opacity(isLoading ? 0 : 1)
            if isLoading {
                Loader(size: size, lineWidth: lineWidth)
            }
        }
        .background(isLoading ? background : .clear)
        .cornerRadius(cornerRadius)
    }
}

struct Loader: View {
    let size: CGSize
    let lineWidth: CGFloat
    let strokeColor: Color = .white

    @State private var isAnimating = false

    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(strokeColor, lineWidth: lineWidth)
            .frame(width: size.width, height: size.height)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
    }
}
