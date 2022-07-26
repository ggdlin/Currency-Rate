//
//  NetworkManager.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let cacheDataKey = "cacheDataKey"
    let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    func fetchCurrencyRate(_ closure: @escaping (CurrencyRate) -> Void ) {
        guard let url = URL(string: url) else {
            closure(CurrencyRate.gag)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("error fetch data: \(error)")
                return
            } else if let currencyData = data {
                self.saveToCache(data: currencyData)
                do {
                    let currencyRate = try JSONDecoder().decode(CurrencyRate.self, from: currencyData)
                    print("раскодирование удалось: \(currencyRate)")
                    closure(currencyRate)
                    
                } catch let error {
                    print("не смог раскодировать полученные данные: \(error)")
                    closure(CurrencyRate.gag)
                }
            }
        }.resume()
    }
    
    private func saveToCache(data: Data) {
        UserDefaults.standard.set(data, forKey: cacheDataKey)
    }
    
    private func loadDataFromCache() -> Data? {
        guard let cacheData = UserDefaults.standard.data(forKey: cacheDataKey) else { return nil }
        return cacheData
    }
    
    private init() {}
}
