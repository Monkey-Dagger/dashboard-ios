//
//  ChartView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    
    var data: [Double]
    @Environment(\.presentationMode) var presentationMode
    
    @State var days = 0
    
    var dayData = [3, 7, 15, 30]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                    .blur(radius: 4)
                                
                                Circle()
                                    .fill(Color.black)
                                    .blur(radius: 2)

                                Image(systemName: "xmark")
                                    .gradientForeground(colors: [Color(#colorLiteral(red: 1, green: 0.6853195493, blue: 0.5029885547, alpha: 1)), Color(#colorLiteral(red: 0.6673402371, green: 0.4177823495, blue: 0.216229177, alpha: 1))])
                                    .font(.system(size: 22))
                                    
                            }
                            .frame(width: geo.size.height * 0.07, height: geo.size.height * 0.07)
                        }
                    }
                    .padding(.horizontal, geo.size.width * 0.08)
                    .padding(.top, geo.size.height * 0.02)
                    
                    LineView(data: [8,23,54,32,12,37,7,23,43], title: "WETH", legend: "Ethereum")
                        .padding(.horizontal)
                    
//                    Picker("days", selection: $days) {
//                        ForEach(0 ..< self.dayData.count) { index in
//                            Text(self.dayData[index]).tag(index)
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}
