//
//  ProductItemView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 18/07/25.
//

import SwiftUI

struct ProductItemView: View {
    
    var productDetails: ProductItemDisplayable
    
    var body: some View {
        
            VStack {
                if let urlString = productDetails.productImageUrl, let url = URL(string: urlString) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                            //.frame(width: 200, height: 200)
                                .clipped()
                        case .failure(let error):
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        default:
                            EmptyView()
                        }
                    }
                    .background(.green.opacity(0.05))
                }
                
                HStack(alignment: .top) {
                    VStack {
                        Text(productDetails.productname)
                            .kerning(1.0)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.black.opacity(0.9))
                        
                        Text(String(productDetails.productPrice))
                            .kerning(1.0)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: productDetails.isBookmarked ?? false ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 25))
                            .frame(width: 45, height: 45, alignment: .topTrailing)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                }
                .padding(5)
                
                Spacer()
            }
    }
}

//struct dataClass: PreviewProvider {
//    
//    static let product = Product(id: "1", imageUrl: "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp", name: "Essence mascara lash princess", price: 9.99, isBookmarked: true)
//    
//    static var previews: some View {
//        ProductItemView(productDetails: product)
//    }
//}
