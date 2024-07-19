//
//  PromoCodeView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 16/07/24.
//

import SwiftUI

enum PromoState {
    case initial
    case empty
    case input
    case valid
    case error
}

struct PromoCodeView: View {

    @State var promoState: PromoState = .input
    @State var promoCode: String = ""
    @State var isEditing = false
    @State var isLoading = false
    @State var isEmpty = false

    var body: some View {
        switch promoState {
        case .initial:

            initialView()
        case .valid:

            validPromoCode()
        default:
            VStack(alignment: .leading) {
                Text("Promo code")
                    .font(.headline)
                    .foregroundColor(Color(hex: "#200833"))
                HStack(spacing: 18) {
                    TextField("Enter promo code", text: $promoCode, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                        if isEditing {
                            self.isEmpty = false
                            promoState = .input
                        }
                    }, onCommit: {
                        validatePromoCode()
                    })
                    .padding()
                    .frame(height: 48)
//                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                isEmpty ? Color.red : Color(
                                    hex: "#200833"
                                ),
                                lineWidth: self.isEditing ? 2 : 1
                            )
                    )
                    .modifier(ClearButton(callBack: {
                        debugPrint("Clear Button Clicked")
                        promoCode = ""
                    }))

                    Button("APPLY") {
                        if promoCode.isEmpty {
                            isEmpty = true
                            return
                        }
                        // Implement your promo code validation logic here
                        isLoading = true
                        print(promoCode)
                    }
                    .padding()
                    .frame(width: 72, height: 48)
                    .foregroundColor(.white)
                    .font(.callout)
                    .background(Color(hex: "#200833"))
                    .cornerRadius(8)
                    .modifier(
                        LoadingButtonModifier(
                            size: .init(
                                width: 25,
                                height: 25
                            ),
                            lineWidth: 3,
                            background: Color(
                                hex: "#200833"
                            ),
                            cornerRadius: 8,
                            isLoading: $isLoading
                        )
                    )
                }

                if isEmpty {
                    Label(
                        title: { Text("Required") },
                        icon: { Image(systemName: "42.circle") }
                    )
                }
            }.padding()
        }
    }

    @ViewBuilder

    func validPromoCode() -> some View {

        HStack {
            Image("Progress Chip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 16)

            VStack(alignment: .leading, spacing: 4) {
                Text("Promo code Activated!")
                    .foregroundStyle(Color.black)
                    .font(.subheadline)
                Text("You've got an extra 100 spins")
                    .foregroundStyle(Color.init(hex: "#736A90"))
                    .font(.callout)
            }.padding(EdgeInsets.init(top: 7, leading: 0, bottom: 7, trailing: 10))

            Button("Remove") {

            }.padding(.trailing, 10)
                .foregroundStyle(Color.red)

        }.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    Color(hex: "#C1BDD0"),
                    lineWidth: 1
                )
        )
        .frame(height: 59)
    }

    @ViewBuilder
    func initialView() -> some View {
        HStack(alignment: .center) {

            Image(systemName: "plus")
                .foregroundStyle(Color(.red))

            Button("Enter promo code") {
                self.promoState = .input
            }
            .foregroundColor(.red)

        }.padding()
    }

    func validatePromoCode() {
        // Validation logic here
        self.promoState = .valid
    }
}

#Preview {
    PromoCodeView()
}

struct ClearButton: ViewModifier {
    var callBack: () -> Void

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            Button(action: {
                callBack()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(10)
        }
    }
}
