//
//  NameViewController.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 14/08/24.
//

//import UIKit
//
//class NameViewController: UIViewController {
//    var viewModel: OnBoardingViewModel!
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "How do we call you?"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.keyboardType = .alphabet
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
//        view.addSubview(nameLabel)
//        view.addSubview(nameTextField)
//        
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
//            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameTextField.widthAnchor.constraint(equalToConstant: 300)
//        ])
//        
//        nameTextField.addTarget(self, action: #selector(nameChanged), for: .editingChanged)
//    }
//
//    @objc private func nameChanged() {
//        viewModel.form.name = nameTextField.text ?? ""
//    }
//}
