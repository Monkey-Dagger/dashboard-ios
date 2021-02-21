//
//  Wallet.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import Foundation
import SwiftUI

struct Wallet: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var address: String
}
