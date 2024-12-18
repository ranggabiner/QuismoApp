//
//  uygiv.swift
//  QuitSmoking
//
//  Created by PadilKeren on 19/08/24.
//

import SwiftUI

struct ProgressBarView: View {
    let currentStep: Int
    let totalSteps = 8
    var onBackButtonPressed: () -> Void
    
    var body: some View {
        HStack {
            // Back Button
            Button(action: {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                onBackButtonPressed()
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 12, height: 21)
                    .padding(.horizontal, 21)
            }
            
            Spacer()
            
            // Page Indicators
            HStack(spacing: 10) {
                ForEach(1...totalSteps, id: \.self) { step in
                    Image(systemName: currentStep == step ? "circle.fill" : (currentStep > step ? "circle.fill" : "circle"))
                        .foregroundColor(
                            currentStep == step ? Color("Secondary") :
                            (step < currentStep ? Color("YellowTint3") : Color("White"))
                        )
                        .font(.system(size: currentStep == step ? 16 : 16))
                        .scaleEffect(currentStep == step ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.4), value: currentStep)
                        .bold()
                }
            }
            Spacer(minLength: 65)
        }
        .padding()
    }
}

#Preview {
    ProgressBarView(currentStep: 4, onBackButtonPressed: {})
}
