//
//  CurrencyRateViewModel.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import Foundation

class CurrencyRateViewModel: ObservableObject {
    @Published private var currencyRate: CurrencyRate = CurrencyRate.gag
    
    var valutesData: [ValuteData] {
        currencyRate.Valute.values.sorted { $0.CharCode < $1.CharCode }
    }
    
    var currencyChoiceList: [ValuteData] {
        var list = currencyRate.Valute
        list["RUS"] = ValuteData.rub
        return list.values.sorted { $0.CharCode < $1.CharCode }
    }
    
    var actualDate: String {
//        let date =
        String(currencyRate.Date.prefix(while: { $0 != "T" }))
//        date.description
    }
    
    
    
    // MARK: - variables for currency calculator
    @Published var outputValut: ValuteData = ValuteData.rub
    @Published var inputValut: ValuteData = ValuteData.rub
    
    
    var valueForResultField: String {
        guard let inputValue = Double(inputValueField) else { return ""}
        let result = (inputValut.Value * inputValue * Double(outputValut.Nominal) / Double(inputValut.Nominal) / outputValut.Value )
        return String(format: "%.2f", result)
    }
    
    @Published var inputValueField: String = "0"
    
    func changeInputValue(value: String) {
        if "1234567890".contains(value.first ?? Character("")) {
            if inputValueField == "0" { inputValueField = "" }
            inputValueField.append(value)
        } else if value == "." && !inputValueField.contains(Character(".")) {
            if inputValueField.isEmpty { inputValueField.append("0")}
            inputValueField.append(value)
        } else if value == "<<" && !inputValueField.isEmpty {
            inputValueField.removeLast()
            if inputValueField.isEmpty { inputValueField = "0" }
        }
    }
    
    func clearInputValue() {
        inputValueField = "0"
    }
    
    func swapValutes() {
        let temporaryValue = inputValut
        inputValut = outputValut
        outputValut = temporaryValue
    }
    
    func updateList() {
        NetworkManager.shared.fetchCurrencyRate { [weak self] data in
            DispatchQueue.main.async {
                self?.currencyRate = data
            }
        }
        outputValut = currencyRate.Valute["USD"] ?? ValuteData.rub
    }
    

}
