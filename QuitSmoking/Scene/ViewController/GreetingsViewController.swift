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
        label.textColor = UIColor(named: "White")
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(UIColor(named: "Primary"), for: .normal)
        button.backgroundColor = UIColor(named: "White")
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
    
    private let imageMascott: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreetingsPoppy")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Extend the layout to cover the entire screen, including safe areas
        self.edgesForExtendedLayout = .all
        
        // Set the background color
        if let backgroundColor = UIColor(named: "Primary") {
            self.view.backgroundColor = backgroundColor
        }
        
        // Add the UI elements and set constraints
        setupUI()
        
        // Add action for the next button
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(imageMascott)
        view.addSubview(greetingsLabel)
        view.addSubview(nextButtonView)
        
        NSLayoutConstraint.activate([
            // Greetings label positioning
            greetingsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 208),
            greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            greetingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            
            // Next button positioning
            nextButtonView.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 42),
            nextButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButtonView.widthAnchor.constraint(equalToConstant: 100),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 42),
            
            // Image mascot positioning
            imageMascott.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imageMascott.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageMascott.widthAnchor.constraint(equalToConstant: 393),
            imageMascott.heightAnchor.constraint(equalToConstant: 393)
        ])
    }
    
    @objc private func nextButtonTapped() {
        let quitReasonView = QuitReasonViewController() // Initialize your QuitReasonViewController
        quitReasonView.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(quitReasonView, animated: true)
    }
}
