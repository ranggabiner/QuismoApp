//
//  AddSmokeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 13/08/24.
//

import SwiftUI

struct AddSmokeView: View {
    @StateObject var viewModel = AddSmokeViewModel(cigaretteLogUseCase: CigaretteLogUseCase(repository: LocalUserRepository()))
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack{
                        Image("AddSmokeImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .offset(CGSize(width: 0, height: -180))
                        //                .background(.red)
                        
                        Spacer()
                    }
                }
                
                
                VStack{
                    
                    Text("Oops..")
                        .foregroundStyle(.blueTint1)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Craving for smoke?")
                        .foregroundStyle(.blueTint1)
                        .fontWeight(.semibold)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Take a deep breath!")                .foregroundStyle(.blueShade3)
                        .font(.system(size: 24, weight: .medium))
                    
                    Spacer()
                    
                    Text("By taking deep breaths, you can calm down and reduce the craving, helping you feel more in control.")
                        .foregroundStyle(.blueTint1)
                    
                    Spacer()
                    
                    NavigationLink(destination: BreathingTechniqueView()) {
                        Text("Try breathing technique")
                            .bold()
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Button(action: {
                        // Show the alert
                        showingAlert = true
                    }) {
                        Text("I want to smoke")
                            .bold()
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    .alert("Are you sure want to smoke?", isPresented: $showingAlert) {
                        Button("Yes") {
                            // Handle "Yes" action
                            viewModel.addSmoke()
                        }
                        Button("No") {
                            // Handle "No" action
                        }
                        
                    }
                    
                }
                .frame(width: 300, height: 350)
                .offset(CGSize(width: 0, height: 80.0))
                //                        .background(.red)
            }
        }
        
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 250, height: 46)
            .background(.blueShade1)
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Adds a press effect
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 250, height: 46)
            .background(.clear)
            .foregroundColor(.blueShade1)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Adds a press effect
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


#Preview {
    AddSmokeView()
}
