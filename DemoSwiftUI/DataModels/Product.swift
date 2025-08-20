//
//  Product.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 21/07/25.
//

import Foundation

struct Product: Codable, ProductItemDisplayable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Double?
    let rating: Double?
    let images: [String]?
    let thumbnail: String?
    var isBookmarked: Bool? = false
}

extension Product {
    var productId: Int {
        self.id ?? 0
    }
    
    var productImageUrl: String? {
        self.thumbnail
    }
    
    var productname: String {
        self.title ?? ""
    }
    
    var productPrice: Double {
        self.price ?? 0
    }
}

