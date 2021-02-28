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
    
    @State private var favoriteColor = "7"
    var colors = ["7", "10", "15", "30"]
    
    @State var number = 0
    
    @State var someData = [[1367.9119, 1518.9429, 1655.4427, 1591.1954, 1718.634, 1677.6046, 1608.7526],
                           [1367.9119, 1518.9429, 1655.4427, 1591.1954, 1718.634, 1677.6046, 1608.7526, 1744.9111, 1771.7502, 1733.8922],
                           [1367.9119, 1518.9429, 1655.4427, 1591.1954, 1718.634, 1677.6046, 1608.7526, 1744.9111, 1771.7502, 1733.8922, 1783.0614,
                            1840.1874, 1808.5856, 1807.6942, 1782.3368], [1367.9119, 1518.9429, 1655.4427, 1591.1954, 1718.634, 1677.6046, 1608.7526,
                                                                          1744.9111, 1771.7502, 1733.8922, 1783.0614, 1840.1874, 1808.5856, 1807.6942,
                                                                          1782.3368, 1741.1108, 1843.9778, 1935.4589, 1961.7488, 1926.2693, 1941.7208,
                                                                          1794.303, 1572.6844, 1629.2178, 1458.1758, 1453.5874, 1399.3295, 1346.4266]]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: geo.size.width * 0.12, height: geo.size.height * 0.007)
                        .foregroundColor(Color(#colorLiteral(red: 0.7991705537, green: 0.8040333986, blue: 0.8125162125, alpha: 1)))
                        .padding(.top, 5)
                    
                    Picker(selection: $favoriteColor, label: Text("")) {
                        ForEach(colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: geo.size.width * 0.90)
                    .padding(.top, geo.size.height * 0.03)
                    
                    LineView(data: someData[colors.firstIndex(of: favoriteColor)!], title: "WETH", legend: "Ethereum")
                            .padding(.horizontal)
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}
