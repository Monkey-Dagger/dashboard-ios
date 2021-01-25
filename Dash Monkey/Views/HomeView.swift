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
    @State var searchTitle = "btc"
    
    func changeSearch(title: String) -> String {
        
        if title == "" {
            return "b"
        } else if title == "b" {
            return "bt"
        } else if title == "bt" {
            return "btc"
        } else {
            return ""
        }
        
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(NeuUtils.baseColor)
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("spot prices,")
                        .foregroundColor(Color(#colorLiteral(red: 0.7991705537, green: 0.8040333986, blue: 0.8125162125, alpha: 1)))
                        .font(.system(size: 18, design: .monospaced))
                        .fontWeight(.bold)
                        .padding(.leading, geo.size.width * 0.06)
                        .padding(.top)
                    
                    Text("please specify a ticker")
                        .foregroundColor(Color(#colorLiteral(red: 0.7991705537, green: 0.8040333986, blue: 0.8125162125, alpha: 1)))
                        .font(.system(size: 18, design: .monospaced))
                        .fontWeight(.bold)
                        .padding(.leading, geo.size.width * 0.06)
                    
                    Text("if not specified all the tokens \nwill be shown")
                        .foregroundColor(Color(#colorLiteral(red: 0.4594413638, green: 0.4790457487, blue: 0.4829743505, alpha: 1)))
                        .font(.system(size: 14, design: .monospaced))
                        .fontWeight(.medium)
                        .padding(.leading, geo.size.width * 0.06)
                        .padding(.top, 5)
                    
                    TextField(searchTitle, text: $search)
                        .onReceive(timer, perform: { _ in
                            searchTitle = changeSearch(title: searchTitle)
                            if search != "" {
                                timer.upstream.connect().cancel()
                            }
                        })
                        .foregroundColor(Color(#colorLiteral(red: 0.2324362993, green: 0.2710780203, blue: 0.2916917801, alpha: 1)))
                        .padding(.leading, geo.size.width * 0.06)
                        .font(.system(size: 28, weight: .heavy, design: .monospaced))
                        .hoverEffect()

                    Spacer()
                        
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
