//
//  OnboardingBottomSheetView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 03.06.2023.
//

import UIKit

class OnboardingBottomSheetView: UIView {
    
    public var buttonTitle: String? {
        didSet {
            guard let title = buttonTitle else { return }
            onboardingButton.title = title
        }
    }
    
    private let onboardingButton = CustomButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.layer.cornerRadius = 12
        self.backgroundColor = Colors.blur
    }
}
