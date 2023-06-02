//
//  CartTotalPriceView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class CartTotalPriceView: UIView {
    
    public var totalItems: Int? {
        didSet {
            guard let totalItems = totalItems else { return }
            cartTotalLabel.text = "\(totalItems) items: Total (Including Delivery)"
        }
    }
    
    public var totalPrice: Int? {
        didSet {
            guard let totalPrice = totalPrice else { return }
            cartTotalPrice.text = "$\(totalPrice)"
        }
    }
    
    private let cartTotalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    } ()
    
    private let cartTotalPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white.withAlphaComponent(0.98)
        [cartTotalLabel, cartTotalPrice].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        cartTotalLabel.anchor(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingTop: 16, paddingBottom: 16, paddingLeft: 16)
        
        cartTotalPrice.anchor(top: self.topAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, paddingTop: 16, paddingRight: 16, paddingBottom: 16)
    }
}
