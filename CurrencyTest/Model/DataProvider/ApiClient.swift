//
//  ApiClient.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import Foundation

class ApiClient: DataProvider {
    
    func getCurrencies(_ onCompletion: @escaping ([Currency]) -> Void, _ onError: @escaping (Error?) -> Void) {
        let url = URL(string: "http://phisix-api3.appspot.com/stocks.json")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let error = error { onError(error) }
            guard let data = data else {return onError(nil)}
            do {
                let stockModel = try JSONDecoder().decode(StockRequestModel.self, from: data)
                onCompletion(stockModel.stock)
            } catch {
                onError(error)
            }
        }
        
        task.resume()
    }
    
}
