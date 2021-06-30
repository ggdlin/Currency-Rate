//
//  CurrencyRowViewModel.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 29.05.2021.
//

import Foundation

class CurrencyRowViewModel {
    private let valute: ValuteData
    
    var nameWithNominal: String {
        "\(valute.Nominal) \(valute.CharCode)"
    }
    var name: String {
        valute.Name
    }
    var value: String {
        String(format: "%.4f", valute.Value)
    }
    var delta: Double {
        valute.Value - valute.Previous
    }
    
    var charCode: String {
        valute.CharCode
    }
    
    init(valute: ValuteData) {
        self.valute = valute
    }
    
}
