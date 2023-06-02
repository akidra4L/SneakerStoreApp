//
//  Shoes.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class Shoes {
    
    private var id: String
    public var image: UIImage
    public var shoesBrand: String
    public var shoesDescription: String
    public var price: Int
    public var quantity: Int?
    
    public init(image: UIImage, shoesBrand: String, shoesDescription: String, price: Int) {
        self.id = UUID().uuidString
        self.image = image
        self.shoesBrand = shoesBrand
        self.shoesDescription = shoesDescription
        self.price = price
    }
    
    public func equals(_ shoes: Shoes) -> Bool {
        return self.id == shoes.id
    }
}
