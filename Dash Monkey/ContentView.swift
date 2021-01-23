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

    var body: some View {
        ZStack {
            Color(NeuUtils.baseColor)
                .ignoresSafeArea(.all)
            Text("Hello")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
