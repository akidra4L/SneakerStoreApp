//
//  CustomButton.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 30.05.2023.
//

import UIKit

class CustomButton: UIButton {
    
    public init() {
        super.init(frame: .zero)
        self.backgroundColor = .blue
        self.layer.cornerRadius = 12
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
