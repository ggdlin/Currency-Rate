//
//  Currency.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import Foundation

struct CurrencyRate: Decodable {
    let Date: String
    let PreviousDate: String
    let PreviousURL: String
    let Timestamp: String
    let Valute: [String:ValuteData]
    
    static let gag = CurrencyRate(
        Date: "2021-06-16T11:30:00+03:00",
        PreviousDate: "yesterday",
        PreviousURL: "",
        Timestamp: "",
        Valute: [:]
    )
    
}

struct ValuteName: Decodable {
    let AUD: ValuteData
    let AZN: ValuteData
    let GBP: ValuteData
    let AMD: ValuteData
    let BYN: ValuteData
    let BGN: ValuteData
    let BRL: ValuteData
    let HUF: ValuteData
    let HKD: ValuteData
    let DKK: ValuteData
    let USD: ValuteData
    let EUR: ValuteData
    let INR: ValuteData
    let KZT: ValuteData
    let CAD: ValuteData
    let KGS: ValuteData
    let CNY: ValuteData
    let MDL: ValuteData
    let NOK: ValuteData
    let PLN: ValuteData
    let RON: ValuteData
    let XDR: ValuteData
    let SGD: ValuteData
    let TJS: ValuteData
    let TRY: ValuteData
    let TMT: ValuteData
    let UZS: ValuteData
    let UAH: ValuteData
    let CZK: ValuteData
    let SEK: ValuteData
    let CHF: ValuteData
    let ZAR: ValuteData
    let KRW: ValuteData
    let JPY: ValuteData
    
    
}

struct ValuteData: Decodable {
    let ID: String
    let NumCode: String
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
    
    static let rub = ValuteData(
        ID: "",
        NumCode: "643",
        CharCode: "RUB",
        Nominal: 1,
        Name: "Рубль Российской Федерации",
        Value: 1,
        Previous: 1)
    
}
