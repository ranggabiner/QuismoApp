//
//  QuitReasonViewController.swift
//  QuitSmoking
//
//  Created by Nur Nisrina on 13/08/24.
//

import UIKit

class QuitReasonViewController: UIViewController {
    var viewModel: OnBoardingViewModel!
    private var selectedReasons: [String] = []
    private let selectedReasonRectangleColor = UIColor(named: "YellowTint3")
    private let defaultReasonRectangleColor = UIColor(named: "White")
    private let enabledNextButtonColor = UIColor(named: "White")
    private let disabledNextButtonColor = UIColor(named: "Gray1")
    private let enabledNextTitleColor = UIColor(named: "Primary")
    private let disabledNextTitleColor = UIColor(named: "White")

    private let reasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Great to hear! Before we begin, I’d like to understand what’s driving you to quit. What’s your main reason?"
        label.textColor = UIColor(named: "White")
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let reasonHealthButton: UIButton = createReasonButton(title: "My health")
    private let reasonFamilyButton: UIButton = createReasonButton(title: "My family")
    private let reasonWellBeingButton: UIButton = createReasonButton(title: "My well-being")
    private let reasonMoneyButton: UIButton = createReasonButton(title: "To save money")
    private let reasonChildButton: UIButton = createReasonButton(title: "To have a child")
    private let reasonFreedomButton: UIButton = createReasonButton(title: "My freedom")
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(named: "Primary"), for: .normal)
        button.backgroundColor = UIColor(named: "White")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var reasonButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [reasonHealthButton, reasonFamilyButton, reasonWellBeingButton, reasonMoneyButton, reasonChildButton, reasonFreedomButton])
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
    
    private let poppy: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingPoppy")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let progressBar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "OnboardingProgress1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Back")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .all
        
        if let backgroundColor = UIColor(named: "Primary") {
            self.view.backgroundColor = backgroundColor
        }
        
        setupUI()
        setupActions()
        
//        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(progressBar)
        view.addSubview(backButton)
        view.addSubview(poppy)
        view.addSubview(reasonLabel)
        view.addSubview(reasonButtonStackView)
        view.addSubview(nextButtonView)
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: 262),
            progressBar.heightAnchor.constraint(equalToConstant: 20),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            backButton.centerXAnchor.constraint(equalTo: progressBar.leftAnchor, constant: -33),
            backButton.widthAnchor.constraint(equalToConstant: 262),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            
            poppy.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            poppy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poppy.widthAnchor.constraint(equalToConstant: 176),
            poppy.heightAnchor.constraint(equalToConstant: 175),
            
            reasonLabel.topAnchor.constraint(equalTo: poppy.bottomAnchor, constant: 0),
            reasonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            reasonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            
            reasonButtonStackView.topAnchor.constraint(equalTo: reasonLabel.bottomAnchor, constant: 20),
            reasonButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reasonButtonStackView.widthAnchor.constraint(equalToConstant: 300),
            
            nextButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButtonView.topAnchor.constraint(equalTo: reasonButtonStackView.bottomAnchor, constant: 22),
            nextButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButtonView.widthAnchor.constraint(equalToConstant: 108),
            nextButtonView.heightAnchor.constraint(equalToConstant: 46),
            
            reasonHealthButton.heightAnchor.constraint(equalToConstant: 42),
            reasonFamilyButton.heightAnchor.constraint(equalToConstant: 42),
            reasonWellBeingButton.heightAnchor.constraint(equalToConstant: 42),
            reasonMoneyButton.heightAnchor.constraint(equalToConstant: 42),
            reasonChildButton.heightAnchor.constraint(equalToConstant: 42),
            reasonFreedomButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    private func setupActions() {
        reasonHealthButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonFamilyButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonWellBeingButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonMoneyButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonChildButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
        reasonFreedomButton.addTarget(self, action: #selector(reasonChanged(_:)), for: .touchUpInside)
    }
    
    private static func createReasonButton(title: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(named: "Blue066ACC"), for: .normal)
        button.backgroundColor = UIColor(named: "White")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
//        button.adjustsFontSizeToFitWidth = false
//        button.showsTouchWhenHighlighted = false
//        button.layer.masksToBounds = true
//        button.layer.borderWidth = 0
        
        let circleImageView = UIImageView(image: UIImage(systemName: "circle"))
        circleImageView.tag = 100
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(circleImageView)
        
        NSLayoutConstraint.activate([
            circleImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            circleImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            circleImageView.widthAnchor.constraint(equalToConstant: 24),
            circleImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        return button
    }
    
    @objc private func reasonChanged(_ sender: UIButton) {
        guard let imageView = sender.viewWithTag(100) as? UIImageView else { return }
        
        sender.isSelected.toggle()
        
        let imageName = sender.isSelected ? "checkmark.circle.fill" : "circle"
        imageView.image = UIImage(systemName: imageName)
        sender.backgroundColor = sender.isSelected ? selectedReasonRectangleColor : defaultReasonRectangleColor
        
        if sender.isSelected {
            selectedReasons.append(sender.currentTitle ?? "")
        } else {
            if let index = selectedReasons.firstIndex(of: sender.currentTitle ?? "") {
                selectedReasons.remove(at: index)
            }
        }
        nextButton.isEnabled = !selectedReasons.isEmpty
    }
    
//    @objc private func nextButtonTapped() {
//        viewModel.form.quitReasons = selectedReasons
//
//        let quitReasonView = QuitReasonViewController()
//        quitReasonView.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(quitReasonView, animated: true)
//    }
    
}

#Preview {
    QuitReasonViewController()
}
