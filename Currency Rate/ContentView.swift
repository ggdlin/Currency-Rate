//
//  ContentView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 25.05.2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: CurrencyRateViewModel
    
    var body: some View {
      
            Text("Test")
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
