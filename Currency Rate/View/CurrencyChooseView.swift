//
//  CurrencyChooseView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 29.05.2021.
//

import SwiftUI

struct CurrencyChooseView: View {
    let valutesData: [ValuteData]
    var valutesList: [ValuteData] {
        valutesData.filter { valutesData in
            if !filtr.isEmpty {
                return valutesData.CharCode.localizedCaseInsensitiveContains(filtr) ||
                    valutesData.Name.localizedCaseInsensitiveContains(filtr)
            } else { return true }
        }
    }
    
    @State var filtr: String = ""
    @Binding var choosenValute: ValuteData
    @Binding var isAppear: Bool
    
    var body: some View {
        
        VStack(alignment: .center) {
            VStack {
                Text("Валюты")
                TextField("фильтр", text: $filtr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Divider()
            List {
                ForEach(valutesList, id: \.ID) { valute in
                    Button(action: {
                        self.choosenValute = valute
                        self.isAppear = false
                    }, label: {
                        CurrencyRowView(viewModel: CurrencyRowViewModel(valute: valute))
                    })
                }
            }
        }
    }
}

struct ValuteChooseView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyChooseView(valutesData: [ValuteData(ID: "",
                                                    NumCode: "",
                                                    CharCode: "rub",
                                                    Nominal: 1,
                                                    Name: "rub",
                                                    Value: 2,
                                                    Previous: 1)],
                           choosenValute:  .constant(ValuteData(ID: "",
                                                                NumCode: "",
                                                                CharCode: "rub",
                                                                Nominal: 1,
                                                                Name: "rub",
                                                                Value: 2,
                                                                Previous: 1)),
                           isAppear: .constant(true)
        )
    }
}
