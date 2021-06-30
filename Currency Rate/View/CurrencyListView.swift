//
//  CurrencyListView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 28.05.2021.
//

import SwiftUI

struct CurrencyListView: View {
    let valutesData: [ValuteData]
    var valutesList: [ValuteData] {
        valutesData.filter { valutesData in
            if !filtr.isEmpty {
                return valutesData.CharCode.localizedCaseInsensitiveContains(filtr) ||
                    valutesData.Name.localizedCaseInsensitiveContains(filtr)
            } else { return true }
        }
    }
    @State private var filterIsChanging: Bool = false
    @State private var filtr: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text("Курсы")
                HStack {
                    TextField("фильтр", text: $filtr, onEditingChanged: { isChange in
                        filterIsChanging = isChange
                        print(isChange ? "changed!" : "non changed")
                        
                    })
                    
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    if filterIsChanging {
                        Button("Cancel", action: cancel )
                    }
                }
                  
            }
            .padding()
            Divider()
            List {
                ForEach(valutesList, id: \.ID) { valute in
                    CurrencyRowView(viewModel: CurrencyRowViewModel(valute: valute))
                }
            }
        }
    }
    
    func cancel() {
        filtr = ""
        UIApplication.shared.endEditing()
        filterIsChanging = false
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}



struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView(valutesData: [ValuteData(ID: "", NumCode: "", CharCode: "", Nominal: 1, Name: "rub", Value: 2, Previous: 1)]
        )
    }
}
