//
//  ColorExtension.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 16/07/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
struct ContentView: View {
    @State private var promoState: PromoState = .initial
    @State private var promoCode: String = ""

    var body: some View {
        VStack {
            TextField("Enter promo code", text: $promoCode, onEditingChanged: { isEditing in
                if isEditing {
                    promoState = .input
                }
            }, onCommit: {
                validatePromoCode()
            })
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 2)
            )
            .padding()

            Text(message)
                .foregroundColor(messageColor)
                .padding()

            Button(action: {
                validatePromoCode()
            }) {
                Text("Apply")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }

    var borderColor: Color {
        switch promoState {
        case .initial, .input:
            return .gray
        case .valid:
            return .green
        case .error:
            return .red
        default:
            return .gray
        }
    }

    var message: String {
        switch promoState {
        case .initial:
            return "Enter a promo code."
        case .empty:
            return "Promo code cannot be empty."
        case .input:
            return "Checking promo code..."
        case .valid:
            return "Promo code is valid!"
        case .error:
            return "Promo code is invalid."
        }
    }

    var messageColor: Color {
        switch promoState {
        case .valid:
            return .green
        case .error:
            return .red
        default:
            return .black
        }
    }

    func validatePromoCode() {
        if promoCode.isEmpty {
            promoState = .empty
        } else if promoCode == "VALIDCODE" {
            promoState = .valid
        } else {
            promoState = .error
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
