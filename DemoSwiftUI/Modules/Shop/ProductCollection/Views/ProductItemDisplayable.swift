//
//  ProductItemDisplayable.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 18/07/25.
//

import Foundation

protocol ProductItemDisplayable {
    var productId: Int { get }
    var productImageUrl: String? { get }
    var productname: String { get }
    var productPrice: Double { get }
    var isBookmarked: Bool? { get }
}
