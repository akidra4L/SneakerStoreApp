//
//  ShoesCell.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class ShoesCell: UICollectionViewCell {
    
    static let cellIdentifier = "ShoesCell"
    
    public var shoes: Shoes? {
        didSet {
            guard let shoes = shoes else { return }
            shoesImageView.image = shoes.image
            brandLabel.text = shoes.shoesBrand
            descriptionLabel.text = shoes.shoesDescription
            priceLabel.text = "$\(shoes.price)"
        }
    }
    
    public var isAddedToCart: Bool? = false {
        didSet {
            guard let isAddedToCart = isAddedToCart else { return }
            guard let shoes = shoes else { return }
            if isAddedToCart {
                cellButton.title = "Remove"
                cellButton.backgroundColor = .black.withAlphaComponent(0.8)
                priceLabel.text = "1 • $\(shoes.price)"
            } else {
                cellButton.title = "Add to cart"
                cellButton.backgroundColor = .black
                priceLabel.text = "$\(shoes.price)"
            }
        }
    }
    
    private let shoesImageView = CustomImageView()
    
    private let cellButton = CustomButton(type: .addToCart)
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    } ()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Colors.lightGray
        return label
    } ()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
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
        [shoesImageView, cellButton, brandLabel, descriptionLabel, priceLabel].forEach { self.addSubview($0) }
        
        setConstraints()
        setButtons()
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.05
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    private func setConstraints() {
        shoesImageView.anchor(top: self.topAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 2, paddingRight: 2, paddingLeft: 2, height: 156)
        
        cellButton.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingRight: 6, paddingBottom: 12, paddingLeft: 6, height: 40)
        
        brandLabel.anchor(top: shoesImageView.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 2, paddingRight: 6, paddingLeft: 6)
        
        descriptionLabel.anchor(top: brandLabel.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 2, paddingRight: 6, paddingLeft: 6)
        
        priceLabel.anchor(top: descriptionLabel.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 4, paddingRight: 6, paddingLeft: 6)
    }
    
    private func setButtons() {
        cellButton.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        cellButton.title = "Add to cart"
    }
}

extension ShoesCell {
    
    @objc public func handleButtonAction() {
        if let isAddedToCart = self.isAddedToCart {
            guard let shoes = self.shoes else { return }
            switch isAddedToCart {
            case true:
                ShoesService.shared.removeShoesFromCart(shoes)
            case false:
                ShoesService.shared.addShoesToCart(shoes)
            }
        }
        
        self.isAddedToCart = !self.isAddedToCart!
    }
}
