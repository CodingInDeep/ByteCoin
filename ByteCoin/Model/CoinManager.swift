//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "2E670157-689E-4B04-83E4-A1ADF2F6078E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, respose, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                //Format the data we got back as a string to be able to print it.
                                let dataAsString = String(data: data!, encoding: .utf8)
                                print(dataAsString)

            }
            task.resume()
            
        }
    }

}
