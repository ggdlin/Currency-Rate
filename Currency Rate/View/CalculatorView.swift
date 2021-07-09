//
//  CalculatorView.swift
//  Currency Rate
//
//  Created by Ivanov Sergey on 28.05.2021.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: CurrencyRateViewModel
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Данные актуальны на: \(viewModel.actualDate)")
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
//                Spacer()
//                Image(systemName: "arrow.clockwise")
            }
            .padding()
            
            Spacer()
            
            
            CurrencyField(value: viewModel.valueForResultField,
                          valutesData: viewModel.currencyChoiceList,
                          choosenValute: $viewModel.outputValut,
                          clearAction: nil)
                .padding()
            HStack {
                
            
            Image(systemName: "arrow.up.arrow.down")
                
                .resizable()
                .font(Font.title.weight(.ultraLight))
                .frame(width: 50, height: 50)
                .onTapGesture {
                    viewModel.swapValutes()
                }
                .padding(.horizontal, 45)
            Spacer()
            }
            CurrencyField(value: viewModel.inputValueField,
                          valutesData: viewModel.currencyChoiceList,
                          choosenValute: $viewModel.inputValut,
                          clearAction: viewModel.clearInputValue)
                .padding()
            VStack {
                HStack {
                    CalcButton(value: "7", action: { value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "8", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "9", action: {value in viewModel.changeInputValue(value: value)})
                }
                HStack {
                    CalcButton(value: "4", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "5", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "6", action: {value in viewModel.changeInputValue(value: value)})
                }
                HStack {
                    CalcButton(value: "1", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "2", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "3", action: {value in viewModel.changeInputValue(value: value)})
                }
                HStack {
                    CalcButton(value: "<<", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: "0", action: {value in viewModel.changeInputValue(value: value)})
                    CalcButton(value: ".", action: {value in viewModel.changeInputValue(value: value)})
                }
            }
            .padding(.bottom, 20)
            
            
        }

    }
}

struct CurrencyField: View {
    let value: String
    let valutesData: [ValuteData]
    
    @Binding var choosenValute: ValuteData
    @State private var isChooseValute: Bool = false
    
    var clearAction: (() -> Void)?
    
    var body: some View {
        ZStack {
            Capsule()
                .stroke()
                .frame(height: 60)
            
            HStack {
                Label("\(choosenValute.CharCode)", image: "\(choosenValute.CharCode)")
                    .frame(width: 110)
                    .onTapGesture { isChooseValute = true }
                    .padding(.leading, 20)
                Text("\(value)")
                Spacer()
                if !value.isEmpty && clearAction != nil {
                    Button(action: clearAction ?? {} ) {
                        Image(systemName: "delete.left")
                            .padding()
                    }
                }
            }
            
        }
        .sheet(isPresented: $isChooseValute) {
            CurrencyChooseView(valutesData: valutesData,
                               choosenValute: $choosenValute,
                               isAppear: $isChooseValute)
        }
    }
    
    
}

struct CalcButton: View {
    let value: String
    let action: (String) -> Void
    
    var body: some View {
            ZStack {
                Circle()
                    .strokeBorder(lineWidth: 2, antialiased: true)
                Text("\(value)")
                    .font(.title)
                
            }
            .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .onTapGesture { action(value) }
        
        
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CurrencyRateViewModel())
//        CurrencyField(value: "0")
//        CalcButton(value: "4", action: {})
    }
}
