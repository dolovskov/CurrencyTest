//
//  CurrencyViewModel.swift
//  CurrencyTest
//
//  Created by Доловсков Владислав on 10.04.2018.
//  Copyright © 2018 Доловсков Владислав. All rights reserved.
//

import Foundation

class CurrencyViewModel {
    
    let dataProvider: DataProvider
    
    var currencies: [Currency] = []
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func updateCurrencies(complete: @escaping () -> Void, onError: @escaping (Error?) -> Void) {
        dataProvider.getCurrencies({ (currencies) in
            self.currencies = currencies
            complete()
        }, onError)
    }
    
    func getRowCount() -> Int {
        return self.currencies.count
    }
    
    func getViewModelForCell(index: Int) -> CurrencyCellViewModel {
        let viewModel = CurrencyCellViewModel(currency: currencies[index])
        return viewModel
    }
    
    
}
