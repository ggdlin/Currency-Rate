//
//  CurrencyRowView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 29.05.2021.
//

import SwiftUI

struct CurrencyRowView: View {
    let viewModel: CurrencyRowViewModel
    
    var body: some View {
        HStack {
            Image("\(viewModel.charCode)")
            VStack(alignment: .leading) {
                Text("\(viewModel.nameWithNominal)")
                Text("\(viewModel.name)")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(viewModel.value) RUB")
                Text("\(viewModel.delta)")
                    .foregroundColor(viewModel.delta < 0 ? .red : .green)
            }
        }
    }
}

struct CurrencyRowView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRowView(viewModel: CurrencyRowViewModel(valute: ValuteData(ID: "", NumCode: "", CharCode: "AZN", Nominal: 1, Name: "ruble ", Value: 1, Previous: 1)))
    }
}
