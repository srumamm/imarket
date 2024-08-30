//
//  ListofProductModel.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import Foundation

class ProductListVM: ObservableObject {
    @Published var products: [Product] = []
    @Published var likedItems: [Product] = []
    @Published var cartItems: [Product] = []
    
    func fetchProducts() async throws {
        self.products = try await ProductService.fetchProducts()
    }
    
    func cartCalcTotal() -> Double {
        var sum = 0.0
        for product in cartItems {
            sum += product.price
        }
        return sum
    }
    
}
