//
//  URLSession+Extension.swift
//  EComDemo
//
//  Created by Krishna on 20/05/20.
//  Copyright © 2020 Krishna. All rights reserved.
//

import Foundation

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask(with url: URL, completionHandler: @escaping (ProductsResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(ProductsResponse.self, from: data), response, nil)
        }
    }

    func productsResponseTask(with url: URL, completionHandler: @escaping (ProductsResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

}
