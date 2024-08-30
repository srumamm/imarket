//
//  ListofProductModel.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import Foundation

class ProductListVM: ObservableObject {
    @Published var products: [Product] = []
    @Published var favorites: [Product] = []
    @Published var cart: [Product] = []
    
    func fetchProducts() async throws {
        self.products = try await ProductService.fetchProducts()
    }
    
    func calcTotal() -> Double {
        var sum = 0.0
        for product in cart {
            sum += product.price
        }
        return sum
    }
    
}
