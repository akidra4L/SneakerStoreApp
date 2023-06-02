//
//  CartViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    private var cartItems = [Shoes]()
    
    private let emptyCartView = EmptyCartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
    
    private func setUI() {
        [emptyCartView].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        emptyCartView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 300)
    }
}

extension CartViewController {
    
    private func updateUI() {
        cartItems = ShoesService.shared.cartItems
        updateEmptyCartViewVisibility()
    }
    
    private func updateEmptyCartViewVisibility() {
        if cartItems.isEmpty {
            emptyCartView.isHidden = false
        } else {
            emptyCartView.isHidden = true
        }
    }
}
