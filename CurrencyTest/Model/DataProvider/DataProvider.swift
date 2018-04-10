//
//  DataProvider.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import Foundation

protocol DataProvider {
    
    func getCurrencies(_ onCompletion: @escaping ([Currency]) -> Void, _ onError: @escaping (Error?) -> Void)
    
}
