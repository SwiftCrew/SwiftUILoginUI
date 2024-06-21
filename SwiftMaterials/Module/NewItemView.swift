//
//  NewItemView.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 21/06/24.
//

import SwiftUI

struct NewItemView: View {

    @StateObject var viewModel = NewItemViewModel()
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()

            Form {
                // Textfield
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())

                MTButton(title: "Save", foreground: .white, background: .pink) {
                    viewModel.save()
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewItemView()
}
