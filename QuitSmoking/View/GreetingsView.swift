//
//  GreetingsView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 15/08/24.
//

import SwiftUI

struct Greetings: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> GreetingsViewController {
        let viewController = GreetingsViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: GreetingsViewController, context: Context) {}
}

#Preview {
    Greetings(viewModel: OnBoardingViewModel())
}