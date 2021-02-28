//
//  TnxListView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 28/02/21.
//

import SwiftUI

struct TnxListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                                .frame(width: geo.size.height * 0.08, height: geo.size.height * 0.08)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Circle()
                                    .foregroundColor(neuColor)
                                    .blur(radius: 4)
                                
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .blur(radius: 2)

                                Text("$")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    .font(.system(size: 22))
                                    
                            }
                            .frame(width: geo.size.height * 0.08, height: geo.size.height * 0.08)
                            
                        }
                        .padding(.top, geo.size.height * 0.09)
                        .padding(.horizontal, geo.size.width * 0.05)
                        
                        VStack {
                            HStack {
                                Text("your transactions,")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                                    .padding(.leading, geo.size.width * 0.06)
                                
                                Spacer()
                            }
                            HStack {
                                Text("tap on a card to see details \ntoken transfers not included.")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                    .font(.system(size: 14, design: .monospaced))
                                    .fontWeight(.medium)
                                    .padding(.leading, geo.size.width * 0.06)
                                    .padding(.top, 5)
                                Spacer()
                            }
                        }
                        
                        TnxListViewElements(wallet: wallet)
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .ignoresSafeArea(.all)
        }
    }
}

struct TnxListViewElements: View {
    
    var neuDarkColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 1.0)) // Neu original 212426
    var neuLightColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 0.5))
    var threeRowGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var wallet: Wallet
    
    @State var showTxnDetails = false
    
    var tempData = [
        TxnModel(block_signed_at: Date(), tx_hash: "jkghsefugfesui", tx_offset: 0, success: true, from_address: "hvefiuhsvabifes", to_address: "hjefsvbhuvefs",
                 from_address_label: "hjefsbuhfebs", to_address_label: "hjfbsehjbfes", amount: 12.5,
                 amount_in_quote: 12.4, gas_offered: 12.5, gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5),
        TxnModel(block_signed_at: Date(), tx_hash: "jkghsefugfesui", tx_offset: 0, success: false,
                 from_address: "hvefiuhsvabifeytj6rjrdjyrjrydrys", to_address: "hjefsvbhuvefs", from_address_label: "hjefsbuhfebs",
                 to_address_label: "hjfbsehjbfes", amount: 12.5, amount_in_quote: 12.4, gas_offered: 12.5,
                 gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5),
        TxnModel(block_signed_at: Date(), tx_hash: "jkghsdjydyjrdjryjrydefugfesui", tx_offset: 0, success: true,
                 from_address: "hvefiuhjrydjdrdjrydjyrdjydsvabifes", to_address: "hjefsjdyrdjryjryddjryvbhuvefs", from_address_label: "hjefsbuhfebs",
                 to_address_label: "hjfbsehjbfes", amount: 12.5, amount_in_quote: 12.4, gas_offered: 12.5,
                 gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5),
        TxnModel(block_signed_at: Date(), tx_hash: "jkghsefugfesui", tx_offset: 0, success: true,
                 from_address: "hvefijrdjdrjrdjyruhsvabifes", to_address: "hjefsvbhuvefs", from_address_label: "hjefsbuhfebs",
                 to_address_label: "hjfbsehjbfes", amount: 12.5, amount_in_quote: 12.4, gas_offered: 12.5,
                 gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5),
        TxnModel(block_signed_at: Date(), tx_hash: "jkghsefugfesui", tx_offset: 0, success: true,
                 from_address: "hvefiuhsdjryjdrjdrydjryrjydvabifes", to_address: "hjefsdjrjryddjryjyrdjrydrdjyvbhuvefs", from_address_label: "hjefsbuhfebs",
                 to_address_label: "hjfbsehjbfes", amount: 12.5, amount_in_quote: 12.4, gas_offered: 12.5,
                 gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5)]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: threeRowGrid) {
                    ForEach(tempData) { txn in
                        Button(action: {
                            self.showTxnDetails.toggle()
                        }) {
                            TnxViewElement(txn: txn, height: geo.size.height, width: geo.size.width)
                                .padding(.horizontal)
                        }.sheet(isPresented: $showTxnDetails) {
                            TxnDetailView(txn: txn)
                        }
                    }
                }
            }
        }
    }
}

struct TnxViewElement: View {
    var txn: TxnModel
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
            VStack {
                HStack {
                    Spacer()
                    if txn.success! {
                        Circle()
                            .fill(Color(.green))
                            .frame(width: height * 0.05, height: height * 0.025)
                            .padding(.trailing)
                            .padding(.top, height * 0.04)
                    } else {
                        Circle()
                            .fill(Color(.red))
                            .frame(width: height * 0.05, height: height * 0.025)
                            .padding(.trailing)
                            .padding(.top, height * 0.04)
                    }
                    
                }
                Spacer()
            }
            VStack {
                HStack {
                    Text(txn.from_address!)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        .padding(.leading, width * 0.05)
                        .padding(.top, height * 0.05)
                        .frame(width: width * 0.70, alignment: .leading)
                        .lineLimit(1)
                        .truncationMode(.middle)
                    Spacer()
                }
                HStack {
                    Image(systemName: "arrow.triangle.swap")
                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding(.leading, width * 0.30)
                    Spacer()
                }
                HStack {
                    Text(txn.to_address!)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        .padding(.leading, width * 0.05)
                        .frame(width: width * 0.70, alignment: .leading)
                        .lineLimit(1)
                        .truncationMode(.middle)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(neuColor)
                            .frame(width: width * 0.25, height: height * 0.06)
                            .cornerRadius(width * 0.30)
                        
                        Text("Amount")
                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                            .font(.system(size: 12, weight: .semibold))
                    }
                    
                    ZStack {
                        Rectangle()
                            .fill(neuColor)
                            .frame(width: width * 0.33, height: height * 0.06)
                            .cornerRadius(width * 0.30)
                        
                        Text("\(String(format: "%.2f", txn.amount_in_quote!))")
                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .padding(.trailing)
                }
                .padding(.bottom, height * 0.04)
            }
        }
    }
}
