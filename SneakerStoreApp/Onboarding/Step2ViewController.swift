//
//  Step2ViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class Step2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func nextButtonTapped() {
        let step3ViewController = Step3ViewController()
        navigationController?.pushViewController(step3ViewController, animated: true)
    }
}
