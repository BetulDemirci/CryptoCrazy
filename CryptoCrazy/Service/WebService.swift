//
//  WebService.swift
//  CryptoCrazy
//
//  Created by Semafor on 29.09.2020.
//  Copyright © 2020 Semafor. All rights reserved.
//

import Foundation

class WebService{
    
    func downloadCurrencies(url : URL, completionHandler: @escaping([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completionHandler(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                if let crypto = cryptoList{
                    completionHandler(crypto)
                }
                
            }
        }.resume()
    }
}
