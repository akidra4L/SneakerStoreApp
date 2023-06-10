//
//  OnboardingBottomSheetView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 03.06.2023.
//

import UIKit

protocol OnboardingBottomSheetViewDelegate: AnyObject {
    func didButtonTap() -> Void
}

class OnboardingBottomSheetView: UIView {
    
    weak var delegate: OnboardingBottomSheetViewDelegate?
    
    public var buttonTitle: String? {
        didSet {
            guard let title = buttonTitle else { return }
            onboardingButton.title = title
        }
    }
    
    private let onboardingButton = CustomButton()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var textLabel = makeTextLabel()
    
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
        
        [onboardingButton, titleLabel, textLabel].forEach { addSubview($0) }
        onboardingButton.layer.cornerRadius = 28
        
        setActions()
        setConstraints()
    }
    
    private func setConstraints() {
        onboardingButton.anchor(
            right: self.rightAnchor,
            bottom: self.bottomAnchor,
            left: self.leftAnchor,
            paddingRight: 16,
            paddingBottom: 58,
            paddingLeft: 16,
            height: 54
        )
        
        titleLabel.anchor(
            top: self.topAnchor,
            right: self.rightAnchor,
            left: self.leftAnchor,
            paddingTop: 80,
            paddingRight: 16,
            paddingLeft: 16
        )
        
        textLabel.anchor(
            top: titleLabel.bottomAnchor,
            right: self.rightAnchor,
            left: self.leftAnchor,
            paddingTop: 16,
            paddingRight: 16,
            paddingLeft: 16
        )
    }
    
    private func setActions() {
        onboardingButton.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func handleButtonTapped() {
        delegate?.didButtonTap()
    }
}

extension OnboardingBottomSheetView {
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "Fast shipping"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 26, weight: .medium)
        return label
    }
    
    private func makeTextLabel() -> UILabel {
        let label = UILabel()
        label.text = "Get all of your desired sneakers in one place."
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }
}
