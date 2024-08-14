//
//  QuitReasonViewController.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import UIKit

class QuitReasonViewController: UIViewController {
    var viewModel: OnBoardingViewModel!

    private let reasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Why you want to quit smoking?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let reasonSegmentedControl: UISegmentedControl = {
        let items = ["Health", "Save Money"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        view.addSubview(reasonLabel)
        view.addSubview(reasonSegmentedControl)

        NSLayoutConstraint.activate([
            reasonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reasonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            reasonSegmentedControl.topAnchor.constraint(equalTo: reasonLabel.bottomAnchor, constant: 20),
            reasonSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reasonSegmentedControl.widthAnchor.constraint(equalToConstant: 300)
        ])

        reasonSegmentedControl.addTarget(self, action: #selector(reasonChanged), for: .valueChanged)
    }

    @objc private func reasonChanged() {
        viewModel.form.quitReason = reasonSegmentedControl.titleForSegment(at: reasonSegmentedControl.selectedSegmentIndex) ?? ""
    }
}
