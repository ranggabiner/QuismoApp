//
//  PricePerPackView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct PricePerPackView: View {
    @StateObject var viewModel: OnBoardingViewModel

    var body: some View {
        VStack {
            PricePerPack(viewModel: viewModel)
            NavigationLink(destination: NameView(viewModel: viewModel), label: {
                Text("Next")
            })
        }
    }
}

struct PricePerPack: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> PricePerPackViewController {
        let viewController = PricePerPackViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: PricePerPackViewController, context: Context) {}
}

//#Preview {
//    PricePerPackView()
//}
