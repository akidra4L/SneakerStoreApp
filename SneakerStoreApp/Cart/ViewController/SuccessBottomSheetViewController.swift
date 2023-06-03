//
//  SuccessBottomSheetViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 03.06.2023.
//

import UIKit

protocol SuccessBottomSheetDelegate: AnyObject {
    func didTapBackToShopping()
}

class SuccessBottomSheetViewController: UIViewController {
    
    weak var delegate: SuccessBottomSheetDelegate?
    
    private var backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .white
        background.layer.cornerRadius = 12
        return background
    } ()
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Your order is succesfully\nplaced. Thanks!"
        return label
    } ()
    
    private let backButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        self.view.backgroundColor = .clear
        
        [backgroundView, successLabel, backButton].forEach { self.view.addSubview($0) }
        
        setConstraints()
        
        setButtons()
    }
    
    private func setConstraints() {
        backgroundView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, height: 312)
        
        backButton.anchor(right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingRight: 16, paddingBottom: 58, paddingLeft: 16, height: 54)
        
        successLabel.anchor(right: self.view.rightAnchor, bottom: backButton.topAnchor, left: self.view.leftAnchor, paddingRight: 16, paddingBottom: 24, paddingLeft: 16)
    }
    
    private func setButtons() {
        backButton.title = "Get back to shopping"
        backButton.layer.cornerRadius = 24
        backButton.addTarget(self, action: #selector(backToShopping), for: .touchUpInside)
    }
}

extension SuccessBottomSheetViewController {
    
    @objc private func backToShopping() {
        dismiss(animated: true)
        delegate?.didTapBackToShopping()
    }
}
