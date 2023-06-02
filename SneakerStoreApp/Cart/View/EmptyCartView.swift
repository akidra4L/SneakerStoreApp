//
//  EmptyCartView.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class EmptyCartView: UIView {
    
    private let emptyCartTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.text = "Cart is empty"
        return label
    } ()
    
    private let emptyCartText: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.text = "Find interesting models in the Catalog."
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
        [emptyCartTitle, emptyCartText].forEach { self.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        emptyCartTitle.centerInView(in: self)
        
        emptyCartText.anchor(top: emptyCartTitle.bottomAnchor, right: self.rightAnchor, left: self.leftAnchor, paddingTop: 16, paddingRight: 16, paddingLeft: 16)
    }
}
