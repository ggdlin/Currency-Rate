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
    
    func fetchCurrencyRate() -> CurrencyRate {
        guard let url = URL(string: url) else {
            return CurrencyRate.gag
            
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("error fetch data: \(error)")
                return
            }
            guard let currencyData = data else { return }
            self.saveToCache(data: currencyData)
        }.resume()
        
        guard let currencyData = loadDataFromCache() else { return CurrencyRate.gag }
        
        do {
            let currencyRate = try JSONDecoder().decode(CurrencyRate.self, from: currencyData)
            print("раскодирование удалось: \(currencyRate)")
            return currencyRate
            
        } catch let error {
            print("не смог раскодировать полученные данные: \(error)")
            return CurrencyRate.gag
        }
        
        
    }
    
    private func saveToCache(data: Data) {
        UserDefaults.standard.set(data, forKey: cacheDataKey)
    }
    
    private func loadDataFromCache() -> Data? {
        guard let cacheData = UserDefaults.standard.data(forKey: cacheDataKey) else { return nil }
        return cacheData
    }
    
    private init() {
        
    }
}
