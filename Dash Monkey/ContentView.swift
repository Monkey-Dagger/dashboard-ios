//
//  ContentView.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 23/01/21.
//

import SwiftUI
import Neumorphic
import Synth

struct ContentView: View {
    
    @State var isActive = true
    @State var play = 1
    var monkeys = ["monkey", "monkeyTwo", "monkeyThree"]
    var body: some View {
        if isActive {
            ZStack {
                Color(NeuUtils.baseColor)
                    .ignoresSafeArea(.all)
                LottieView(name: monkeys.randomElement()!)
                    .frame(width: 300, height: 300)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = false
                    }
                }
            }
        } else {
            TabView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
