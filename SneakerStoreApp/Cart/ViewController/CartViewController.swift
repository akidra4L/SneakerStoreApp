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
    
    private let cartTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = Colors.grayMainBackground
        table.register(CartCell.self, forCellReuseIdentifier: CartCell.cellIdentifier)
        table.separatorStyle = .none
        return table
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        setUI()
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }
    
    private func setUI() {
        [emptyCartView, cartTableView].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        emptyCartView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 300)
        
        cartTableView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 16, paddingBottom: 100)
    }
}

extension CartViewController {
    
    private func updateUI() {
        cartItems = ShoesService.shared.cartItems
        updateEmptyCartViewVisibility()
        cartTableView.reloadData()
    }
    
    private func updateEmptyCartViewVisibility() {
        if cartItems.isEmpty {
            emptyCartView.isHidden = false
            cartTableView.isHidden = true
        } else {
            emptyCartView.isHidden = true
            cartTableView.isHidden = false
        }
    }
}

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.cellIdentifier, for: indexPath) as? CartCell else {
            return UITableViewCell()
        }
        
        cell.cartItem = cartItems[indexPath.row]
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
