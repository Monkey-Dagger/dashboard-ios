//
//  TabView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 26/01/21.
//

import SwiftUI
import Neumorphic
import Synth

struct TabView: View {
    @State var selectedTab = 0
    var textColor = Color(UIColor(red: 249.0/255.0, green: 211.0/255.0, blue: 180.0/255.0, alpha: 0.9))
    var neuDarkColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 1.0)) // Neu original 212426
    var neuLightColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 0.5))
    let impactSoft = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(NeuUtils.baseColor)
                    .ignoresSafeArea(.all)
                VStack {
                    if selectedTab == 0 {
                        HomeView()
                    } else if selectedTab == 1 {

                    } else {
                        WalletView()
                    }
                    Spacer()
                    Divider()
                    HStack(spacing: geo.size.width * 0.05) {
                        Button(action: {
                            selectedTab = 0
                            impactSoft.impactOccurred()
                        }) {
                            if selectedTab != 0 {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(NeuUtils.baseColor))
                                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                        .cornerRadius(geo.size.width * 8 / 16)
                                    
                                    HStack {
                                        Image(systemName: "house.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.2570180706, green: 0.2277260155, blue: 0.1947839718, alpha: 1))])
                                        Text("Home")
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
                                        Image(systemName: "house.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        Text("Home")
                                            .foregroundColor(textColor)
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    }
                                }
                            }
                        }
                        Button(action: {
                            selectedTab = 1
                            impactSoft.impactOccurred()
                        }) {
                            if selectedTab != 1 {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(NeuUtils.baseColor))
                                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                        .cornerRadius(geo.size.width * 8 / 16)
                                    
                                    HStack {
                                        Image(systemName: "die.face.5.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.2570180706, green: 0.2277260155, blue: 0.1947839718, alpha: 1))])
                                        Text("Dash")
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
                                        Image(systemName: "die.face.5.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        Text("Dash")
                                            .foregroundColor(textColor)
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    }
                                }
                            }
                            
                        }
                        Button(action: {
                            selectedTab = 2
                            impactSoft.impactOccurred()
                        }) {
                            if selectedTab != 2 {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(NeuUtils.baseColor))
                                        .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.06)
                                        .cornerRadius(geo.size.width * 8 / 16)
                                    
                                    HStack {
                                        Image(systemName: "creditcard.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 0.7048456211, green: 0.6359616405, blue: 0.58123129, alpha: 1)), Color(#colorLiteral(red: 0.2570180706, green: 0.2277260155, blue: 0.1947839718, alpha: 1))])
                                        Text("Wallet")
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
                                        Image(systemName: "creditcard.fill")
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        Text("Wallet")
                                            .foregroundColor(textColor)
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 5)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
