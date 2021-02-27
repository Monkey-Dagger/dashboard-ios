//
//  HomeView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 26/01/21.
//

import SwiftUI
import Synth

struct HomeView: View {
    @State var search = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var searchTitle = "btc,eth"
    @ObservedObject var spotPriceVM = SpotPriceViewModel()
    
    @State var selectedCurrency = 0
    @State var ShowCurrencySelectView = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(NeuUtils.baseColor)
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("spot prices,")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .padding(.leading, geo.size.width * 0.06)
                                .padding(.top)
                            
                            Text("please specify a ticker")
                                .gradientForeground(colors: [Color(#colorLiteral(red: 0.786473326, green: 0.7942601906, blue: 0.7942601906, alpha: 1)), Color(#colorLiteral(red: 0.4924296141, green: 0.5023575425, blue: 0.4977371097, alpha: 1))])
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .padding(.leading, geo.size.width * 0.06)
                            
                            Text("if not specified all the tokens \nwill be shown")
                                .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                                .font(.system(size: 14, design: .monospaced))
                                .fontWeight(.medium)
                                .padding(.leading, geo.size.width * 0.06)
                                .padding(.top, 5)
                        }
                        Spacer()
                    
                        VStack {
                            
                            Button(action: {
                                self.ShowCurrencySelectView.toggle()
                            }) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color(NeuUtils.baseColor))
                                        .blur(radius: 4)
                                    
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [neuDarkColor, neuLightColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .blur(radius: 2)

                                    Text("\(currency[selectedCurrency][1])")
                                        .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                        .font(.system(size: 22))
                                        
                                }
                                .frame(width: geo.size.height * 0.06, height: geo.size.height * 0.06)
                            }.sheet(isPresented: $ShowCurrencySelectView) {
                                CurrencySelectView(selectedCurrency: $selectedCurrency, spotPriceVM: spotPriceVM, search: $search)
                            }
                            
                        }
                        .padding(.trailing, geo.size.width * 0.05)
                        
                    }
                    
                    TextField(searchTitle, text: $search)
                        .foregroundColor(Color(#colorLiteral(red: 0.4053344131, green: 0.4760627747, blue: 0.5181590915, alpha: 1)))
                        .padding(.leading, geo.size.width * 0.06)
                        .font(.system(size: 28, weight: .heavy, design: .monospaced))
                        .hoverEffect()
                    
                    spotPricesView(spotPriceVM: spotPriceVM)

                    Spacer()
                        
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(spotPriceVM: SpotPriceViewModel())
    }
}
