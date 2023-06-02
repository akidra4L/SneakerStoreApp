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
            imageView.image = shoes.image
        }
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [imageView].forEach { self.addSubview($0) }
        
        setConstraints()
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.05
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    private func setConstraints() {
        imageView.anchor(top: self.topAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 2, paddingRight: 2, paddingLeft: 2, height: 156)
    }
}
