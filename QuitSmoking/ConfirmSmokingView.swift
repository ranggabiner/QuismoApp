//
//  ConfirmSmokingView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 13/08/24.
//

import SwiftUI

struct ConfirmSmokingView: View {
    var body: some View {
        Text("Oops! Wanna take a break?")
        
        NavigationLink(destination: BreathingTechniqueView()) {
            Text("Breath")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        
        NavigationLink(destination: AddSmokeView()) {
            Text("Smoke")
                .padding()
                .foregroundColor(.blue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ConfirmSmokingView()
}
