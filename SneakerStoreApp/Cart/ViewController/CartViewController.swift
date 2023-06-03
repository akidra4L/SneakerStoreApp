//
//  CartViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    private var cartItems = [Shoes]() {
        didSet {
            cartTotalView.totalItems = cartItems.count
            cartTotalView.totalPrice = getTotalPrice()
        }
    }
    
    private let emptyCartView = EmptyCartView()
    
    private let cartTotalView = CartTotalPriceView()
    
    private let cartConfirmButton = CustomButton()
    
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
        [emptyCartView, cartTableView, cartTotalView, cartConfirmButton].forEach { self.view.addSubview($0) }
        
        setConstraints()
        setButtons()
    }
    
    private func setConstraints() {
        emptyCartView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 300)
        
        cartTableView.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, paddingTop: 16, paddingBottom: 200)
        
        cartTotalView.anchor(top: cartTableView.bottomAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, height: 50)
        
        cartConfirmButton.anchor(top: cartTotalView.bottomAnchor, right: self.view.rightAnchor, left: self.view.leftAnchor, paddingTop: 6, paddingRight: 16, paddingLeft: 16, height: 54)
    }
    
    private func setButtons() {
        cartConfirmButton.title = "Confirm Order"
        cartConfirmButton.layer.cornerRadius = 24
        cartConfirmButton.addTarget(self, action: #selector(didConfirmButtonTapped), for: .touchUpInside)
    }
}

extension CartViewController: SuccessBottomSheetDelegate {
    
    func didTapBackToShopping() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateUI() {
        cartItems = ShoesService.shared.cartItems
        updateEmptyCartViewVisibility()
        cartTableView.reloadData()
    }
    
    private func updateEmptyCartViewVisibility() {
        if cartItems.isEmpty {
            emptyCartView.isHidden = false
            cartTableView.isHidden = true
            cartTotalView.isHidden = true
            cartConfirmButton.isHidden = true
        } else {
            emptyCartView.isHidden = true
            cartTableView.isHidden = false
            cartTotalView.isHidden = false
            cartConfirmButton.isHidden = false
        }
    }
    
    private func getTotalPrice() -> Int {
        var sum: Int = 0
        cartItems.forEach { sum += $0.price }
        return sum
    }
    
    @objc private func didConfirmButtonTapped() {
        let alert = UIAlertController(title: "Proceed with payment", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.openCustomBottomSheet()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func openCustomBottomSheet() {
        let successViewController = SuccessBottomSheetViewController()
        successViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: successViewController)
        present(navigationController, animated: true, completion: nil)
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
        cell.selectionStyle = .none
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
