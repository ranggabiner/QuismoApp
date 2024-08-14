//
//  NameView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct NameView: View {
    @StateObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        VStack {
            Name(viewModel: viewModel)
            Button(action: {
                viewModel.saveData()
            }) {
                Text("Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 40)
        }
    }
}

struct Name: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> NameViewController {
        let viewController = NameViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: NameViewController, context: Context) {}
}

//#Preview {
//    NameView()
//}
