//
//  SpotPriceModel.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 26/01/21.
//

import Foundation
import SwiftUI

struct SpotPriceModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var contract_decimals: Int?
    var contract_name: String?
    var contract_ticker_symbol: String?
    var contract_address: String?
    var logo_url: String?
    var quote_rate: Double?
    var rank: Int?
}
