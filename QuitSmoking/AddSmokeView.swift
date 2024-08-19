//
//  AddSmokeView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 13/08/24.
//

import SwiftUI

struct AddSmokeView: View {
    
    @State private var numberText: String = ""
    
    @StateObject var viewModel = AddSmokeViewModel(cigaretteLogUseCase: CigaretteLogUseCase(repository: LocalUserRepository()))
    
    var body: some View {
        VStack{
            
            Text("\(viewModel.cigaretteLog?.cigarettesSmoked.count)")
//            Text("How many cigarettes are you planning to smoke?")
//            
//            TextField("Enter number", text: $numberText)
//                .keyboardType(.numberPad)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                viewModel.addSmoke()
                
                print("\(viewModel.cigaretteLog?.cigarettesSmoked.count)")
            }, label: {
                Text("Add Smoke")
            })
        }
        
        
    }
}

#Preview {
    AddSmokeView()
}
