//
//  DashboardVieModel.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import Foundation

class DashboardVieModel {
    
    private var apiResponse: ProductsResponse?
    let apiUrl = "https://stark-spire-93433.herokuapp.com/json"
    
    var categories: [Category]? {
        if let response = apiResponse {
            return response.categories
        }
        return [Category]()
    }
    
    var rankings: [Ranking]? {
        if let response = apiResponse {
            return response.rankings
        }
        return [Ranking]()
    }
    
    func rankingAt(_ index: Int) -> Ranking? {
        if let response = apiResponse {
            return response.rankings![index]
        }
        return nil
    }
    
    func rankingProductsCountAt(_ index: Int) -> Int {
        return apiResponse?.rankings?[index].products?.count ?? 0
    }
    
    func productsFromRankingAt(_ index: Int) -> [RankingProduct] {
        if let rankingProducts = apiResponse?.rankings?[index].products {
            return rankingProducts
        }
        return [RankingProduct]()
    }
    
    func getCatProductWith(id: Int) -> CategoryProduct? {
        let categories = apiResponse?.categories.flatMap({ cats in
            return cats.map { cat in
                return cat.products.map { p in
                    return p
                }
            }
        })
        
        let products = categories.products?.filter({ p in
            p.id == id
        })
        
        return products
    }
    
    
    
    func getProducts(completion: @escaping (() -> Void)) {
        let task = URLSession.shared.productsResponseTask(with: URL(string: apiUrl)!) { productsResponse, response, error in
            if let productsResponse = productsResponse {
                self.apiResponse = productsResponse
            }
            completion()
        }
        task.resume()
    }
    
}
