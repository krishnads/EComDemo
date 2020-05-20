//
//  ProductsResponse.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import Foundation

// MARK: - ProductsResponse
struct ProductsResponse: Codable {
    let categories: [Category]?
    let rankings: [Ranking]?
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: String?
    let products: [CategoryProduct]?
    let childCategories: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, name, products
        case childCategories
    }
}

// MARK: - CategoryProduct
struct CategoryProduct: Codable {
    let id: Int?
    let name, dateAdded: String?
    let variants: [Variant]?
    let tax: Tax?

    enum CodingKeys: String, CodingKey {
        case id, name
        case dateAdded
        case variants, tax
    }
}

// MARK: - Tax
struct Tax: Codable {
    let name: Name?
    let value: Double?
}

enum Name: String, Codable {
    case vat = "VAT"
    case vat4 = "VAT4"
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let color: String?
    let size: Int?
    let price: Int?
}

// MARK: - Ranking
struct Ranking: Codable {
    let ranking: String?
    let products: [RankingProduct]?
}

// MARK: - RankingProduct
struct RankingProduct: Codable {
    let id, viewCount, orderCount, shares: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case viewCount
        case orderCount
        case shares
    }
}
