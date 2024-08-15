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
        label.text = "Why do you want to quit smoking?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reasonHealthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("For my health", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let reasonMoneyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To save money", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let reasonOtherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Other", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let otherTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please specify..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isHidden = true
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reasonButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reasonHealthButton, reasonMoneyButton, reasonOtherButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nextButtonView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nextButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        view.addSubview(reasonLabel)
        view.addSubview(reasonButtonStackView)
        view.addSubview(otherTextField)
        view.addSubview(nextButtonView)
        
        NSLayoutConstraint.activate([
            reasonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reasonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            reasonButtonStackView.topAnchor.constraint(equalTo: reasonLabel.bottomAnchor, constant: 20),
            reasonButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reasonButtonStackView.widthAnchor.constraint(equalToConstant: 300),
            
            otherTextField.topAnchor.constraint(equalTo: reasonOtherButton.bottomAnchor, constant: 10),
            otherTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            otherTextField.widthAnchor.constraint(equalToConstant: 300),
            
            nextButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButtonView.widthAnchor.constraint(equalToConstant: 300),
            
            reasonHealthButton.heightAnchor.constraint(equalToConstant: 50),
            reasonMoneyButton.heightAnchor.constraint(equalToConstant: 50),
            reasonOtherButton.heightAnchor.constraint(equalToConstant: 50),
            otherTextField.heightAnchor.constraint(equalToConstant: 50),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupActions() {
        reasonHealthButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonMoneyButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonOtherButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
    }
    
    @objc private func reasonChanged(_ sender: UIButton) {
        reasonHealthButton.layer.borderColor = UIColor.clear.cgColor
        reasonMoneyButton.layer.borderColor = UIColor.clear.cgColor
        reasonOtherButton.layer.borderColor = UIColor.clear.cgColor
        reasonHealthButton.backgroundColor = .systemGray6
        reasonMoneyButton.backgroundColor = .systemGray6
        reasonOtherButton.backgroundColor = .systemGray6
        
        otherTextField.isHidden = true
        
        sender.layer.borderColor = UIColor.systemBlue.cgColor
        sender.layer.borderWidth = 2
        sender.backgroundColor = .white
        
        if sender == reasonOtherButton {
            otherTextField.isHidden = false
        }
        
        viewModel.form.quitReason = sender.currentTitle ?? ""
    }
}
