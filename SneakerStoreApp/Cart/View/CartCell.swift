//
//  CartCell.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class CartCell: UITableViewCell {
    
    public static let cellIdentifier = "CartCell"
    
    public var cartItem: Shoes? {
        didSet {
            guard let cartItem = cartItem else { return }
            cartImageView.image = cartItem.image
            brandLabel.text = cartItem.shoesBrand
            descriptionLabel.text = cartItem.shoesDescription
            priceLabel.text = "$\(cartItem.price)"
            cartCellButtonView.cellQuantity = cartItem.quantity
        }
    }
    
    private let cartImageView = CustomImageView()
    
    public let cartCellButtonView = CartCellButtonView()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    } ()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Colors.lightGray
        label.numberOfLines = 2
        return label
    } ()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    } ()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = Colors.grayMainBackground
        return separatorView
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cartCellButtonView.delegate = self
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white.withAlphaComponent(0.98)
        
        [cartImageView, separatorView, brandLabel, descriptionLabel, priceLabel, cartCellButtonView].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        cartImageView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 16, width: 140, height: 140)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, height: 16)
        
        brandLabel.anchor(top: self.topAnchor, left: cartImageView.rightAnchor, paddingTop: 21, paddingLeft: 16)
        
        descriptionLabel.anchor(top: brandLabel.bottomAnchor, left: cartImageView.rightAnchor, paddingTop: 2, paddingLeft: 16)
        
        priceLabel.anchor(top: descriptionLabel.bottomAnchor, left: cartImageView.rightAnchor, paddingTop: 4, paddingLeft: 16)
        
        cartCellButtonView.anchor(top: priceLabel.bottomAnchor, left: cartImageView.rightAnchor, paddingTop: 10, paddingLeft: 16, width: 166, height: 36)
    }
}

extension CartCell: CartCellButtonViewDelegate {
    
    func didPlusButtonTapped() {
        guard let cartItem = cartItem else { return }
        cartItem.quantity! += 1
        self.cartItem = cartItem
    }
    
    func didMinusButtonTapped() {
        guard let cartItem = cartItem else { return }
        cartItem.quantity! -= 1
        self.cartItem = cartItem
    }
}
