//
//  TutorialViewController.swift
//  Vocapic
//
//  Created by ericzero on 8/31/23.
//

import UIKit
import Lottie

class TutorialViewController: UIViewController {
    
    private let animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "animation_touch")
        animationView.loopMode = .loop
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(TutorialViewController.self, action: #selector(btnTapping), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap for Sound and Images"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func btnTapping(){
        dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "tutorial")
    }
    
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8) 
        
        view.addSubview(animationView)
        view.addSubview(exitButton)
        view.addSubview(tapLabel)
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 150),
            animationView.heightAnchor.constraint(equalToConstant: 150),
            
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            exitButton.heightAnchor.constraint(equalToConstant: 30),
            exitButton.widthAnchor.constraint(equalToConstant: 30),
            
            tapLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            tapLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        animationView.play()
    }
}
