//
//  DashboardVieModel.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import Foundation

class DashboardVieModel {
    
    var apiResponse: ProductsResponse?
    let apiUrl = "https://stark-spire-93433.herokuapp.com/json"
    
    
    
    func getProducts(completion: @escaping (() -> Void)) {
        let task = URLSession.shared.productsResponseTask(with: URL(string: apiUrl)!) { productsResponse, response, error in
            if let productsResponse = productsResponse {
                self.apiResponse = productsResponse
            }
        }
        task.resume()
    }
    
}
