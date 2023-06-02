//
//  CartCellButtonView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 03.06.2023.
//

import UIKit

protocol CartCellButtonViewDelegate {
    func didPlusButtonTapped()
    func didMinusButtonTapped()
}

class CartCellButtonView: UIView {
    
    public var delegate: CartCellButtonViewDelegate?
    
    public var cellQuantity: Int? {
        didSet {
            guard let quantity = cellQuantity else { return }
            quantityLabel.text = "\(quantity)"
        }
    }
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    } ()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    } ()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 18
        
        [minusButton, quantityLabel, plusButton].forEach { self.addSubview($0) }
        
        setConstraints()
        
        setActions()
    }
    
    private func setConstraints() {
        quantityLabel.centerInView(in: self)
        
        minusButton.centerY(in: self)
        minusButton.anchor(right: quantityLabel.leftAnchor, paddingRight: 14)
        
        plusButton.centerY(in: self)
        plusButton.anchor(left: quantityLabel.rightAnchor, paddingLeft: 14)
    }
    
    private func setActions() {
        minusButton.addTarget(self, action: #selector(handleMinusButton), for: .touchUpInside)
        minusButton.isUserInteractionEnabled = true
        
        plusButton.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        plusButton.isUserInteractionEnabled = true
    }
}


extension CartCellButtonView {
    
    @objc private func handleMinusButton() {
        print("minus")
        delegate?.didMinusButtonTapped()
    }
    
    @objc private func handlePlusButton() {
        print("plus")
        delegate?.didPlusButtonTapped()
    }
}
