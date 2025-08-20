//
//  ProductResponseModel.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 21/07/25.
//

import Foundation

struct ProductResponseModel: Codable {
    let products: [Product]?
    let total: Int?
    let skip: Int?
    let limit: Int?
}
