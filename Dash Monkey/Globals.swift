//
//  Globals.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 26/01/21.
//

import Foundation
import SwiftUI
import Synth

let covalentAPI = "https://api.covalenthq.com"
let covalentAPIKey = "ckey_84935203df434b2c99ed14e4d7b"

var neuDarkColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 1.0)) // Neu original 212426
var neuLightColor = Color(UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 26.0/255.0, alpha: 0.5))
var neuColor = Color(NeuUtils.baseColor)

var currency = [["USD", "$", "dollarsign"], ["CAD", "$", "dollarsign"],
                ["EUR", "€", "eurosign"], ["SGD", "$", "dollarsign"],
                ["INR", "₹", "indianrupeesign"], ["JPY", "¥", "yensign"],
                ["VND", "₫", "dongsign"], ["CNY", "¥", "yensign"],
                ["KRW", "₩", "wonsign"], ["RUB", "₽", "rublesign"],
                ["TRY", "₺", "turkishlirasign"], ["ETH", "Ξ", "e"]]
