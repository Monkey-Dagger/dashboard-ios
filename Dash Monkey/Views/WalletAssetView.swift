//
//  WalletAssetView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import SwiftUI

struct WalletAssetView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var walletSpotAssetVM = WalletSpotAssetViewModel()
    
    @State var selectedFiat = 0
    @State var showFiatSelectView = false
    
    @ObservedObject var txnVM = TxnViewModel()
    
    @State var fiatValue = "usd"
    
    var wallet: Wallet

    var body: some View {
        GeometryReader { geo in
            ZStack {
                neuColor
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(neuColor)
                                    .blur(radius: 4)
                                
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .blur(radius: 2)

                                Image(systemName: "arrowtriangle.backward")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    .font(.system(size: 22))
                                    
                            }
                            .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: TnxListView(wallet: wallet, txnVM: txnVM)) {
                            ZStack {
                                Circle()
                                    .foregroundColor(neuColor)
                                    .blur(radius: 4)
                                
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .blur(radius: 2)

                                Image(systemName: "waveform.path.ecg")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    .font(.system(size: 22))
                                    
                            }
                            .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                        }
                        
                        Button(action: {
                            showFiatSelectView = true
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(neuColor)
                                    .blur(radius: 4)
                                
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .blur(radius: 2)

                                Text(currency[selectedFiat][1])
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    .font(.system(size: 22))
                                    
                            }
                            .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                        }
                        .sheet(isPresented: $showFiatSelectView) {
                            FiatSelectView(selectedFiat: $selectedFiat, fiatValue: $fiatValue, wallet: wallet, walletSpotAssetVM: walletSpotAssetVM)
                        }
                    }
                    .padding(.top, geo.size.height * 0.09)
                    .padding(.horizontal, geo.size.width * 0.05)
                    
                    VStack {
                        HStack {
                            Text("balance for address,")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .padding(.leading, geo.size.width * 0.06)
                                .padding(.top)
                            
                            Spacer()
                        }
                        HStack {
                            Text("\(wallet.name) (\(wallet.address))")
                                .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                .font(.system(size: 14, design: .monospaced))
                                .fontWeight(.medium)
                                .padding(.leading, geo.size.width * 0.06)
                                .padding(.top, 5)
                            Spacer()
                        }
                    }
                    
                    WalletSpotAssetView(walletSpotAssetVM: walletSpotAssetVM, wallet: wallet, fiat: $fiatValue)

                }
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
    }
}
