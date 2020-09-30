//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Semafor on 29.09.2020.
//  Copyright © 2020 Semafor. All rights reserved.
//

import Foundation

struct CryptoListViewModel{
    let cryptoCurrencyList : [CryptoCurrency]
}

extension CryptoListViewModel{
    func numberRownInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(index:Int) -> CrptoViewModel{
        let crypto = cryptoCurrencyList[index]
        return CrptoViewModel(crptoCurrency: crypto)
    }
}

struct CrptoViewModel{
    let crptoCurrency : CryptoCurrency
}

extension CrptoViewModel{
    var name : String {
        return self.crptoCurrency.currency
    }
    var price : String {
        return self.crptoCurrency.price
    }
}
