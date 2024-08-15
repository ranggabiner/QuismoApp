//
//  QuitReasonView.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

import SwiftUI

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
    QuitReason(viewModel: OnBoardingViewModel())
}
