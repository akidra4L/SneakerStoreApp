//
//  AppDelegate.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 28.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(rootViewController: Step1ViewController())
        
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = navigationController
        
        setupInitialSettings()
        
        return true
    }
    
    fileprivate func setupInitialSettings() {
        UINavigationBar.appearance().isTranslucent = false
    }
}

