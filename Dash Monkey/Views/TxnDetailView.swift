//
//  TxnDetailView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 28/02/21.
//

import SwiftUI

struct TxnDetailView: View {
    var txn: TxnModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            neuColor
                .ignoresSafeArea(.all)
            GeometryReader { geo in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("transaction details,")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                                        .padding(.leading, geo.size.width * 0.06)
                                        .padding(.top)
                                    
                                    Text("quote currency $")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                                        .padding(.leading, geo.size.width * 0.06)
                                }
                                
                                Spacer()
                                
                                if txn.success! {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: geo.size.width * 0.22, height: geo.size.height * 0.05)
                                            .foregroundColor(.green)
                                            .opacity(0.5)
                                        
                                        Text("success")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.trailing, geo.size.width * 0.06)
                                } else {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: geo.size.width * 0.22, height: geo.size.height * 0.05)
                                            .foregroundColor(.red)
                                            .opacity(0.5)
                                        
                                        Text("fail")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.trailing, geo.size.width * 0.06)
                                }
                                
                            }
                            
                            Text("address")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .padding(.leading, geo.size.width * 0.06)
                                .padding(.top)
                            
                            Group {
                                HStack {
                                    Text(txn.from_address!)
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                        .frame(width: geo.size.width * 0.70, alignment: .leading)
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                        .padding(.leading, geo.size.width * 0.06)
                                        .padding(.top, 2)
                                    Spacer()
                                }
                                HStack {
                                    Image(systemName: "arrow.triangle.swap")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        .padding(.leading, geo.size.width * 0.36)
                                    Spacer()
                                }
                                HStack {
                                    Text(txn.to_address!)
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                        .frame(width: geo.size.width * 0.70, alignment: .leading)
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                        .padding(.leading, geo.size.width * 0.06)
                                    Spacer()
                                }
                                
                                Text("transaction hash")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                    .font(.system(size: 15, design: .monospaced))
                                    .fontWeight(.medium)
                                    .padding(.leading, geo.size.width * 0.06)
                                    .padding(.top, 5)
                                
                                HStack {
                                    Text("\(txn.tx_hash!)")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                        .font(.system(size: 15, design: .monospaced))
                                        .fontWeight(.medium)
                                        .padding(.leading, geo.size.width * 0.06)
                                    
                                    Image(systemName: "doc.on.doc")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                }
                                
                                HStack {
                                    Text("gas offered: ")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                        .font(.system(size: 15, design: .monospaced))
                                        .fontWeight(.medium)
                                        .padding(.leading, geo.size.width * 0.06)
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.05)
                                            .cornerRadius(geo.size.width * 0.08)
                                            .blur(radius: 2)
                                        
                                        Text("\(txn.gas_offered!)")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                            .font(.system(size: 12, weight: .semibold))
                                    }
                                }
                                
                                HStack {
                                    Text("gas used: ")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                        .font(.system(size: 15, design: .monospaced))
                                        .fontWeight(.medium)
                                        .padding(.leading, geo.size.width * 0.06)
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.05)
                                            .cornerRadius(geo.size.width * 0.08)
                                            .blur(radius: 2)
                                        
                                        Text("\(txn.gas_spent!) (\(String(format: "%.2f", txn.gas_spent! / txn.gas_offered! * 100))%)")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                            .font(.system(size: 12, weight: .semibold))
                                    }
                                }
                                
                                HStack {
                                    Text("gas price: ")
                                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                        .font(.system(size: 15, design: .monospaced))
                                        .fontWeight(.medium)
                                        .padding(.leading, geo.size.width * 0.06)
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.05)
                                            .cornerRadius(geo.size.width * 0.08)
                                            .blur(radius: 2)
                                        
                                        Text("\(txn.gas_price!)")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                            .font(.system(size: 12, weight: .semibold))
                                    }
                                }
                            }
                            
                            HStack {
                                Text("txn cost: ")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                    .font(.system(size: 15, design: .monospaced))
                                    .fontWeight(.medium)
                                    .padding(.leading, geo.size.width * 0.06)
                                
                                ZStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.05)
                                        .cornerRadius(geo.size.width * 0.08)
                                        .blur(radius: 2)
                                    
                                    Text("\(txn.gas_spent_quote!)")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                        .font(.system(size: 12, weight: .semibold))
                                }
                            }
                            
                            HStack {
                                Text("eth price: ")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                    .font(.system(size: 15, design: .monospaced))
                                    .fontWeight(.medium)
                                    .padding(.leading, geo.size.width * 0.06)
                                
                                ZStack {
                                    Rectangle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: geo.size.width * 0.40, height: geo.size.height * 0.05)
                                        .cornerRadius(geo.size.width * 0.08)
                                        .blur(radius: 2)
                                    
                                    Text("\(txn.gas_rate_quote!)")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                        .font(.system(size: 12, weight: .semibold))
                                }
                            }
                            
                            Spacer()
                            
                        }
                        Spacer()
                    }
                    .padding(.top, geo.size.height * 0.05)
                }
            }
        }
    }
}

struct TxnDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TxnDetailView(txn: TxnModel(block_signed_at: Date(), tx_hash: "jkghsdjydyjrdjryjrydefugfesui", tx_offset: 0, success: true,
                                    from_address: "hvefiuhjrydjdrdjrydjyrdjydsvabifes", to_address: "hjefsjdyrdjryjryddjryvbhuvefs", from_address_label: "hjefsbuhfebs",
                                    to_address_label: "hjfbsehjbfes", amount: 12.5, amount_in_quote: 12.4, gas_offered: 12.5,
                                    gas_price: 12.5, gas_spent: 12.6, gas_spent_quote: 18.5, gas_rate_quote: 13.5))
    }
}
