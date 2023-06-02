//
//  CustomImageView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class CustomImageView: UIImageView {
    
    public init() {
        super.init(frame: .zero)
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
