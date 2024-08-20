//
//  GreetingsView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 15/08/24.
//

import SwiftUI

struct GreetingsView: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> GreetingsViewController {
        let viewController = GreetingsViewController()
        viewController.viewModel = viewModel
        
        return viewController
    }

    func updateUIViewController(_ uiViewController: GreetingsViewController, context: Context) {}
}

struct GreetingsViewView: View {
    var body: some View {
        GreetingsView(viewModel: OnBoardingViewModel())
//            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GreetingsViewView()
}
