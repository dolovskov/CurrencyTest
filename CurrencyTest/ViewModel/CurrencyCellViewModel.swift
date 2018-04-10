//
//  CurrencyCellViewModel.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import Foundation
class CurrencyCellViewModel {
    
    var name: String
    var amount: String
    var volume: String
    
    init(currency: Currency) {
        self.name = currency.name
        self.amount = String(format: "%.2f", currency.price.amount)
        self.volume = String(currency.volume)
    }
    
    
}
