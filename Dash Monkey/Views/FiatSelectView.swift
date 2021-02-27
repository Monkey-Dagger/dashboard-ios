//
//  FiatSelectView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import SwiftUI

struct FiatSelectView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedFiat: Int
    @Binding var fiatValue: String
    
    var wallet: Wallet
    
    @ObservedObject var walletSpotAssetVM: WalletSpotAssetViewModel
    
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
                                    selectedFiat = currency.firstIndex(of: money)!
                                    fiatValue = currency[selectedFiat][0]
                                    walletSpotAssetVM.getAddressBalance(chainID: "\(wallet.chainId)", address: wallet.address, currency: currency[selectedFiat][0])
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    CurrencyItem(selectedNumber: selectedFiat, money: money)
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
