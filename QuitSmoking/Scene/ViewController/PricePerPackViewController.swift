//
//  PricePerPackViewController.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//
//import UIKit
//
//class PricePerPackViewController: UIViewController {
//    var viewModel: OnBoardingViewModel!
//
//    private let costLabel: UILabel = {
//        let label = UILabel()
//        label.text = "How much per pack?"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let costTextField: UITextField = {
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
//        view.addSubview(costLabel)
//        view.addSubview(costTextField)
//
//        NSLayoutConstraint.activate([
//            costLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            costLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            costTextField.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 20),
//            costTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            costTextField.widthAnchor.constraint(equalToConstant: 300)
//        ])
//
//        costTextField.addTarget(self, action: #selector(costChanged), for: .editingChanged)
//    }
//
//    @objc private func costChanged() {
//        viewModel.form.pricePerPack = Int(costTextField.text ?? "0") ?? 0
//    }
//}
