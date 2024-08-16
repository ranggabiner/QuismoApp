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
        label.textColor = UIColor(named: "button")
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
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
        button.backgroundColor = UIColor(named: "button")
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
        imageView.image = UIImage(named: "Mascott")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    //    nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    
    private func setupUI() {
        view.addSubview(imageMascott)
        view.addSubview(greetingsLabel)
        view.addSubview(nextButtonView)
        
        NSLayoutConstraint.activate([
            
            imageMascott.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageMascott.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            imageMascott.widthAnchor.constraint(equalToConstant: 240),
            imageMascott.heightAnchor.constraint(equalToConstant: 240),
            
            greetingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 320),
            greetingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            greetingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53),
            
            nextButtonView.bottomAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 70),
            nextButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButtonView.widthAnchor.constraint(equalToConstant: 80),
            
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 42),
            
        ])
        
        let rotationAngle: CGFloat = .pi / 6
                imageMascott.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }
    
    //    @objc private func nextButtonTapped() {
    //        let quitReasonView = QuitReasonView() // Initialize your QuitReasonView
    //        quitReasonView.modalPresentationStyle = .fullScreen
    //        present(quitReasonView, animated: true, completion: nil)
    //
    //        navigationController?.pushViewController(quitReasonView, animated: true)
    //    }
}
