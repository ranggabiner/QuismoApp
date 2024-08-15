//
//  GreetingsViewController.swift
//  QuitSmoking
//
//  Created by PadilKeren on 15/08/24.
//

import UIKit

class GreetingsViewController: UIViewController {
    var viewModel: OnBoardingViewModel!
    
    private let greetingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Quit smoking is the best decision for you! Ready to start your journey?"
        label.textColor = .white
        label.font = UIFont(name: "SF Pro Rounded", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButtonView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nextButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let bubbleChatView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(bubbleChatView)
        view.addSubview(greetingsLabel)
        view.addSubview(nextButtonView)
        
        NSLayoutConstraint.activate([
            
            bubbleChatView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            bubbleChatView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bubbleChatView.widthAnchor.constraint(equalToConstant: 300),
            bubbleChatView.heightAnchor.constraint(equalToConstant: 80),
            
            greetingsLabel.centerXAnchor.constraint(equalTo: bubbleChatView.centerXAnchor),
            greetingsLabel.centerYAnchor.constraint(equalTo: bubbleChatView.centerYAnchor),
            greetingsLabel.widthAnchor.constraint(equalTo: bubbleChatView.widthAnchor),
            
            nextButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButtonView.widthAnchor.constraint(equalToConstant: 300),
            
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
