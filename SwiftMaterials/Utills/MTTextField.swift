//
//  MTTextField.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 19/06/24.
//

import SwiftUI

struct MTTextField: View {
    @Binding var name: String
    var placeholder: String

    var body: some View {
        TextField(placeholder, text: $name)
            .padding(10)
            .border(.gray)
            .frame(height: 45)
            .cornerRadius(3.0)
    }
}

#Preview {
    MTTextField(name: .constant(""), placeholder: "Enter Detils")
}

