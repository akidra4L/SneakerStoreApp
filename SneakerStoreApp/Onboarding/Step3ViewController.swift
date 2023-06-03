//
//  Step3ViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class Step3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let finishButton = UIButton(type: .system)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func finishButtonTapped() {
        UIApplication.shared.windows.first?.rootViewController = TabBarViewController()
    }
}
