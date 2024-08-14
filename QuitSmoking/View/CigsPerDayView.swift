//
//  CigsPerDayView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct CigsPerDayView: View {
    @StateObject  var viewModel: OnBoardingViewModel

    var body: some View {
        VStack {
            CigsPerDay(viewModel: viewModel)
            NavigationLink(destination: PricePerPackView(viewModel: viewModel), label: {
                Text("Next")
            })
        }
    }
}

struct CigsPerDay: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> CigsPerDayViewController {
        let viewController = CigsPerDayViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: CigsPerDayViewController, context: Context) {
        
    }
}

//#Preview {
//    CigsPerDayView()
//}
