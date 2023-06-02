//
//  SuccessBottomSheetViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 03.06.2023.
//

import UIKit

class SuccessBottomSheetViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        self.view.backgroundColor = .clear
        
        [backgroundView, successLabel].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, height: 312)
        
        successLabel.centerInView(in: backgroundView)
    }
}
