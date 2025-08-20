//
//  ProductCollectionView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 18/07/25.
//

import SwiftUI

struct ProductCollectionView: View {
    
    @StateObject var viewModel = ProductCollectionViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 15),
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products, id: \.productId) { item in
                        ProductItemView(productDetails: item)
                    }
                }
                .padding()
                .task {
                    viewModel.fetchProducts()
                }
            }
            .navigationTitle("Products")
        }
    }
}

//struct productCollectionPreview: PreviewProvider {
//    static func fetchTestData() -> [Product] {
//        var products: [Product] = []
//        for item in 1...30 {
//            let product = Product(id: "\(item)", imageUrl: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp", name: "Essence mascara lash princess", price: 9.99, isBookmarked: false)
//            products.append(product)
//        }
//        return products
//    }
//    
//    static var previews: some View {
//        ProductCollectionView(products: fetchTestData())
//    }
//}
