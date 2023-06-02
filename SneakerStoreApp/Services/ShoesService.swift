//
//  ShoesService.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class ShoesService {
    
    static let shared = ShoesService()
    
    public var cartItems = [Shoes]()
    
    public func getAllShoes() -> [Shoes] {
        return [
            Shoes(image: UIImage(named: "1")!, shoesBrand: "Dolce & Gabbana", shoesDescription: "Кеды с принтом граффити", price: 1251),
            
            Shoes(image: UIImage(named: "2")!, shoesBrand: "Off-White", shoesDescription: "Кроссовки Off-Court 3.0", price: 551),
            
            Shoes(image: UIImage(named: "3")!, shoesBrand: "Jordan", shoesDescription: "Кеды с принтом граффити", price: 1251),
            
            Shoes(image: UIImage(named: "4")!, shoesBrand: "Jordan", shoesDescription: "Кеды с принтом граффити", price: 1251),
            
            Shoes(image: UIImage(named: "5")!, shoesBrand: "New Balance", shoesDescription: "Кроссовки 993 Brown из\nколлаборации с Aimé Leon Dore", price: 325),
        ]
    }
    
    public func addShoesToCart(_ item: Shoes) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.equals(item) }) {
            cartItems[existingItemIndex].quantity! += 1
        } else {
            item.quantity = 1
            cartItems.append(item)
        }
    }
    
    public func removeShoesFromCart(_ item: Shoes) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.equals(item) }) {
            if cartItems[existingItemIndex].quantity ?? 0 > 1 {
                cartItems[existingItemIndex].quantity! -= 1
            } else {
                cartItems.remove(at: existingItemIndex)
            }
        }
    }
}
