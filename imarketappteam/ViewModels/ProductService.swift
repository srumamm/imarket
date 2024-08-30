//
//  MarketService.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import Foundation

class ProductService {
    private static let decoder = JSONDecoder()
    
    static func fetchProducts() async throws -> [Product] {
        let urlString = "https://dummyjson.com/products"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let productResponse = try decoder.decode(Welcome.self, from: data)
        
        return productResponse.products
    }
}
