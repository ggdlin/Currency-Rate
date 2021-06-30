//
//  MainView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: CurrencyRateViewModel
    
    var body: some View {
        
        TabView {
            CalculatorView(viewModel: viewModel)
                .tabItem { Label("Конвертер", systemImage: "arrow.triangle.2.circlepath") }
            CurrencyListView(valutesData: viewModel.valutesData)
                .tabItem { Label("Курсы валют", systemImage: "rublesign.square") }
            Text("settings")
                .tabItem { Label("Настройки", systemImage: "gearshape") }
        }
        .tabViewStyle(DefaultTabViewStyle() )
        .onAppear {
            viewModel.updateList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: CurrencyRateViewModel())
    }
}
