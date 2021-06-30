//
//  Currency_RateApp.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import SwiftUI

@main
struct Currency_RateApp: App {
    @StateObject private var viewModel = CurrencyRateViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
