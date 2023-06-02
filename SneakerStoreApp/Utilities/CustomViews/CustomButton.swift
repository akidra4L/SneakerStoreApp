//
//  CustomButton.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 30.05.2023.
//

import UIKit

class CustomButton: UIButton {
    
    public var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = .black
        self.layer.cornerRadius = 12
        
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
