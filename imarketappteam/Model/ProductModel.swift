//
//  ProductMMVM.swift
//  imarketappteam
//
//  Created by Sruthy Mammen on 8/29/24.
//

import Foundation

struct Welcome: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: Category
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let thumbnail: String
    let images: [String]
    
    static let example = Product(
        id: 1,
        title: "Calvin Klein CK One",
        description: "Makes you smell really good",
        category: .fragrances, 
        price: 20.00,
        discountPercentage: 11.0,
        rating: 3.2,
        stock: 9,
        tags: ["Perfume"],
        brand: "CK",
        sku: "Yes",
        weight: 20,
        warrantyInformation: "No Warranty",
        shippingInformation: "Delivery",
        availabilityStatus: "Available",
        reviews: [Review.example],
        returnPolicy: "No return available",
        minimumOrderQuantity: 1,
        thumbnail: "...",
        images: ["..."]
    )
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
    
    static let example = Review(
        rating: 5,
        comment: "So good!",
        date: "Today",
        reviewerName: "Sruthy Mammen",
        reviewerEmail: "sruthyxmammen@gmail.com"
    )
}
