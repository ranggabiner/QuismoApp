//
//  MikeTestingView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 13/08/24.
//

import SwiftUI

struct MikeTestingView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: ConfirmSmokingView()) {
                    Text("Go to Breathing View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    MikeTestingView()
}
