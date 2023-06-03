//
//  Step1ViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class Step1ViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let image = UIImage(named: "step1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    } ()
    
    private let nextButton = CustomButton()
    
    private let onboardingBottomSheet = OnboardingBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUI()
    }
    
    private func setUI() {
        [backgroundImage, onboardingBottomSheet].forEach { self.view.addSubview($0) }
        
        setConstraints()
        
        setButton()
    }
    
    private func setConstraints() {
        backgroundImage.fillView(self.view)
        self.view.sendSubviewToBack(backgroundImage)
        
        onboardingBottomSheet.anchor(right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, height: 288)
    }
    
    private func setButton() {
        nextButton.title = "Next"
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        let step2ViewController = Step2ViewController()
        navigationController?.pushViewController(step2ViewController, animated: true)
    }
}
