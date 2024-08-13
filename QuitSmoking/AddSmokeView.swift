//
//  AddSmokeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 13/08/24.
//

import SwiftUI

struct AddSmokeView: View {
    
    @State private var numberText: String = ""
    
    var body: some View {
        Text("How many cigarettes are you planning to smoke?")
        
        TextField("Enter number", text: $numberText)
            .keyboardType(.numberPad)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
        
    }
}

#Preview {
    AddSmokeView()
}
