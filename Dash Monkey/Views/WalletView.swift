//
//  WalletView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 28/01/21.
//

import SwiftUI
import Synth

struct WalletView: View {
    
    @State var showAddWallet = false
    
    @State var addresses: [Wallet] = []
        
    var body: some View {
        NavigationView {
            ZStack {
                neuColor
                GeometryReader { geo in
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("your wallet,")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                                Text("please specify a address")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                                
                                Text("to track your assets \nand transactions")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                    .font(.system(size: 14, design: .monospaced))
                                    .fontWeight(.medium)
                                    .padding(.top, 5)
                            }
                            .padding(.top, geo.size.height * 0.06)
                            
                            Spacer()
                            
                            Button(action: {
                                showAddWallet.toggle()
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(neuColor)
                                        .blur(radius: 4)
                                    
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .blur(radius: 2)

                                    Image(systemName: "plus")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                .frame(width: geo.size.height * 0.06, height: geo.size.height * 0.06)
                            }
                            .sheet(isPresented: $showAddWallet) {
                                AddAddressView(addresses: $addresses)
                            }
                            
                        }
                        .padding(.top, geo.size.width * 0.05)
                        
                        if addresses.isEmpty {
                            LottieView(name: "nothing")
                        } else {
                            Group {
                                ScrollView {
                                    ForEach(addresses, id: \.id) { wallet in
                                        NavigationLink(destination: WalletAssetView(wallet: wallet)) {
                                            AddressElement(name: wallet.name, address: wallet.address, width: geo.size.width, height: geo.size.height)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, geo.size.width * 0.06)
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct AddressElement: View {
    let name: String
    let address: String
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(NeuUtils.baseColor))
                .frame(width: width * 0.90, height: 70)
                .blur(radius: 4)
                .cornerRadius(width * 0.06)

            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: width * 0.90, height: 70)
                .cornerRadius(width * 0.06)
                .blur(radius: 2)

            VStack {
                HStack {
                    Text(name)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.leading, width * 0.05)
                    Spacer()
                }

                HStack {
                    Text(address)
                        .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                        .padding(.leading, width * 0.05)

                    Spacer()
                }
                .padding(.top, 1)
            }
        }
        
    }
    
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
