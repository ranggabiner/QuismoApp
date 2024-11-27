//
//  CigsPerDayViewController.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

//import UIKit
//
//class CigsPerDayViewController: UIViewController {
//    var viewModel: OnBoardingViewModel!
//
//    private let cigarettesLabel: UILabel = {
//        let label = UILabel()
//        label.text = "How many cigarettes per day?"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let cigarettesTextField: UITextField = {
//        let textField = UITextField()
//        textField.keyboardType = .numberPad
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//
//    private func setupUI() {
//        view.addSubview(cigarettesLabel)
//        view.addSubview(cigarettesTextField)
//
//        NSLayoutConstraint.activate([
//            cigarettesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            cigarettesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            cigarettesTextField.topAnchor.constraint(equalTo: cigarettesLabel.bottomAnchor, constant: 20),
//            cigarettesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            cigarettesTextField.widthAnchor.constraint(equalToConstant: 300)
//        ])
//
//        cigarettesTextField.addTarget(self, action: #selector(cigarettesChanged), for: .editingChanged)
//    }
//
//    @objc private func cigarettesChanged() {
//        viewModel.form.cigsPerDay = Int(cigarettesTextField.text ?? "0") ?? 0
//    }
//}
//
//#Preview {
//    CigsPerDayViewController()
//}
