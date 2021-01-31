//
//  CurrencySelectView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 29/01/21.
//

import SwiftUI

struct CurrencySelectView: View {
    
    @Binding var selectedCurrency: Int
    
    @ObservedObject var spotPriceVM: SpotPriceViewModel
    
    @Binding var search: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                neuColor
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Group {
                        Text("quote currency,")
                            .foregroundColor(Color(#colorLiteral(red: 0.7991705537, green: 0.8040333986, blue: 0.8125162125, alpha: 1)))
                            .font(.system(size: 18, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.top, geo.size.height * 0.05)
                            .padding(.leading, geo.size.width * 0.06)

                        Text("please select a currency.")
                            .foregroundColor(Color(#colorLiteral(red: 0.7991705537, green: 0.8040333986, blue: 0.8125162125, alpha: 1)))
                            .font(.system(size: 18, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.leading, geo.size.width * 0.06)

                        Text("selected currency is marked")
                            .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                            .font(.system(size: 14, design: .monospaced))
                            .fontWeight(.medium)
                            .padding(.top, 5)
                            .padding(.bottom, 15)
                            .padding(.leading, geo.size.width * 0.06)
                    }
                                        
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(currency, id: \.self) { money in
                                Button(action: {
                                    selectedCurrency = currency.firstIndex(of: money)!
                                    presentationMode.wrappedValue.dismiss()
                                    spotPriceVM.getSpotTokenPrices(search: search, currency: money[0])
                                }) {
                                    CurrencyItem(selectedNumber: selectedCurrency, money: money)
                                        .frame(width: geo.size.width * 0.28, height: geo.size.height * 0.18)
                                        .cornerRadius(geo.size.width * 0.05)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, geo.size.width * 0.05)
                    
                }
            }
        }
    }
}

struct CurrencyItem: View {
    var selectedNumber: Int
    var money: [String]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(neuColor)
                .blur(radius: 4)
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .blur(radius: 2)
            
            VStack {
                Image(systemName: "\(money[2]).circle.fill")
                    .gradientForeground(colors: currency[selectedNumber] != money ? [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))] : [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                    .font(.system(size: 40, weight: .semibold))
                                                        
                Text(money[0])
                    .gradientForeground(colors: currency[selectedNumber] != money ? [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))] : [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 10)
            }
        }
    }
}
