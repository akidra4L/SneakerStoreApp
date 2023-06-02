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
        }
    }
    
    private let cartImageView = CustomImageView()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = Colors.grayMainBackground
        return separatorView
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white.withAlphaComponent(0.98)
        [cartImageView, separatorView].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        cartImageView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingTop: 10, paddingBottom: 10, paddingLeft: 16, width: 140, height: 140)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, height: 16)
    }
}
