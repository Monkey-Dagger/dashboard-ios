//
//  AddWalletView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 01/02/21.
//

import WalletCore
import SwiftUI
import Synth

struct AddAddressView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var address = ""
    @State var name = ""
    
    @State var chain = 1
    let impactSoft = UIImpactFeedbackGenerator(style: .medium)
    
    @Binding var addresses: [Wallet]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                neuColor
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("enter address,")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                            Text("specify name for reference.")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                            
                            Text("to track your address assets and \ntransactions within them")
                                .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                .font(.system(size: 14, design: .monospaced))
                                .fontWeight(.medium)
                                .padding(.top, 5)
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    chain = 1
                                    impactSoft.impactOccurred()
                                }) {
                                    if chain != 1 {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(NeuUtils.baseColor))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                            
                                            HStack {
                                                Text("ethereum")
                                                    .foregroundColor(textColor)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                            }
                                        }
                                    } else {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(NeuUtils.baseColor))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .blur(radius: 4)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                            
                                            Rectangle()
                                                .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                                .blur(radius: 2)
                                                
                                            HStack {
                                                Text("ethereum")
                                                    .foregroundColor(textColor)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                            }
                                        }
                                    }
                                }
                                
                                Button(action: {
                                    chain = 137
                                    impactSoft.impactOccurred()
                                }) {
                                    if chain != 137 {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(NeuUtils.baseColor))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                            
                                            HStack {
                                                Text("matic")
                                                    .foregroundColor(textColor)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.4021375775, green: 0.3603935838, blue: 0.3085331321, alpha: 1))])
                                            }
                                        }
                                    } else {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color(NeuUtils.baseColor))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .blur(radius: 4)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                            
                                            Rectangle()
                                                .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                                .cornerRadius(geo.size.width * 8 / 16)
                                                .blur(radius: 2)
                                                
                                            HStack {
                                                Text("matic")
                                                    .foregroundColor(textColor)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                            }
                                        }
                                    }
                                }
                                Spacer()
                            }
                            
                            TextField("name", text: $name)
                                .foregroundColor(Color(#colorLiteral(red: 0.4053344131, green: 0.4760627747, blue: 0.5181590915, alpha: 1)))
                                .font(.system(size: 26, weight: .heavy, design: .monospaced))
                                .hoverEffect()
                                .padding(.top, 20)
                            
                            TextField("demo.eth", text: $address)
                                .foregroundColor(Color(#colorLiteral(red: 0.4053344131, green: 0.4760627747, blue: 0.5181590915, alpha: 1)))
                                .font(.system(size: 26, weight: .heavy, design: .monospaced))
                                .hoverEffect()
                                .padding(.top, 20)
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    let data = Wallet(name: name, address: address, chainId: chain)
                                    addresses.append(data)
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color(NeuUtils.baseColor))
                                            .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                            .blur(radius: 4)
                                            .cornerRadius(geo.size.width * 8 / 16)
                                        
                                        Rectangle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                            .cornerRadius(geo.size.width * 8 / 16)
                                            .blur(radius: 2)
                                            
                                        HStack {
                                            Text("save")
                                                .foregroundColor(textColor)
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)))
                                        }
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top, 20)
                        }
                        Spacer()
                    }
                    .ignoresSafeArea(.keyboard)
                    Spacer()
                }
                .ignoresSafeArea(.keyboard)
                .padding(.top, geo.size.height * 0.05)
                .padding(.leading, geo.size.width * 0.06)
            }
            .ignoresSafeArea(.keyboard)
        }
        .ignoresSafeArea(.keyboard)
    }
}
