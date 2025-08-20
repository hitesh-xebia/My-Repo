//
//  ProductCollectionViewModel.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 21/07/25.
//

import Foundation

class ProductCollectionViewModel: ObservableObject {
    
    @Published var products: [ProductItemDisplayable] = []
    
    func fetchProducts() {
        guard let url = Bundle.main.url(forResource: "productCollection", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ProductResponseModel.self, from: data)
            products = jsonData.products ?? []
        } catch {
            print("error \(error)")
            // handle error screen
        }
    }
}
