//
//  Shoes.swift
//  SneakerStoreApp
//
//  Created by Alikhan Gubayev on 02.06.2023.
//

import UIKit

class Shoes {
    
    public var id: String
    public var image: UIImage
    
    public init(image: UIImage) {
        self.id = UUID().uuidString
        self.image = image
    }
    
    public func equals(_ shoes: Shoes) -> Bool {
        return self.id == shoes.id
    }
}
