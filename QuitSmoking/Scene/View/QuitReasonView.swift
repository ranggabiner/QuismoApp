//
//  QuitReasonView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

struct QuitReasonView: View {
    @StateObject private var viewModel = OnBoardingViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                QuitReason(viewModel: viewModel)
                NavigationLink(destination: CigsPerDayView(viewModel: viewModel), label: {
                    Text("Next")
                })
            }
        }
    }
}

struct QuitReason: UIViewControllerRepresentable {
    var viewModel: OnBoardingViewModel

    func makeUIViewController(context: Context) -> QuitReasonViewController {
        let viewController = QuitReasonViewController()
        viewController.viewModel = viewModel
        return viewController
    }

    func updateUIViewController(_ uiViewController: QuitReasonViewController, context: Context) {}
}

#Preview {
    QuitReasonView()
}
