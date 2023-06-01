//
//  TabBarViewController.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 31.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        self.tabBar.tintColor = .label
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        self.viewControllers = [
            createNavigationController(for: CatalogViewController(), title: "Catalog", image: UIImage(systemName: "house")!),
            
            createNavigationController(for: CartViewController(), title: "Cart", image: UIImage(systemName: "cart")!),
            
            createNavigationController(for: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person.circle.fill")!)
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navigationController.tabBarItem.image = image
        
        return navigationController
    }
}
