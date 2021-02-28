//
//  WalletSpotAssetView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct WalletSpotAssetView: View {
    @ObservedObject var walletSpotAssetVM: WalletSpotAssetViewModel
    
    var neuDarkColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 1.0)) // Neu original 212426
    var neuLightColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 0.5))
    var threeRowGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var wallet: Wallet
    
    @Binding var fiat: String
    
    var body: some View {
        GeometryReader { geo in
            if walletSpotAssetVM.balances.isEmpty {
                HStack {
                    Spacer()
                    ProgressView()
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                    Spacer()
                }
                .padding(.top, geo.size.height * 0.25)
                
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: threeRowGrid ) {
                        ForEach(walletSpotAssetVM.balances, id: \.self) { token in
                            if token.quote_rate != 0 && token.amount != 0 {
                                BalanceView(token: token, height: geo.size.height, width: geo.size.width)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            walletSpotAssetVM.getAddressBalance(chainID: "\(wallet.chainId)", address: wallet.address, currency: fiat)
        }
    }
}

struct BalanceView: View {
    var token: BalanceModel
    
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(neuColor)
                .frame(width: width * 0.90, height: height * 0.30)
                .blur(radius: 4)
                .cornerRadius(width * 0.08)
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: width * 0.90, height: height * 0.30)
                .cornerRadius(width * 0.08)
                .blur(radius: 2)
            
            HStack {
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(neuColor)
                            .frame(width: width * 0.18, height: width * 0.18)
                        
                        WebImage(url: URL(string: token.logo_url ?? "")) // add default logo
                            .resizable()
                            .frame(width: width * 0.13, height: width * 0.13)
                            .clipShape(Circle())
                    }
                    
                    Text(token.contract_ticker_symbol!)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                        .font(.system(size: 14, design: .rounded))
                }
                .padding(.leading)
                
                VStack {
                    HStack {
                        Text("\(String(format: "%.8f", token.balance!))")
                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.leading, width * 0.04)
                        
                        Spacer()
                    }
                    .padding(.top, height * 0.11)
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(neuColor)
                                .frame(width: width * 0.25, height: height * 0.06)
                                .cornerRadius(width * 0.30)
                            
                            Text("Value")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                .font(.system(size: 12, weight: .semibold))
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(neuColor)
                                .frame(width: width * 0.33, height: height * 0.06)
                                .cornerRadius(width * 0.30)
                            
                            Text("\(String(format: "%.5f", token.amount!))")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .padding(.bottom, height * 0.04)
                }
            }
        }
        .padding(.leading, width * 0.05)
    }
}
