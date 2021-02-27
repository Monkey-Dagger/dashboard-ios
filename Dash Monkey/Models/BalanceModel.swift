//
//  BalanceModel.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import Foundation
import SwiftUI

struct BalanceModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var contract_decimals: Int?
    var contract_name: String?
    var contract_ticker_symbol: String?
    var contract_address: String?
    var supports_erc: [String]?
    var logo_url: String?
    var quote_rate: Double?
    var amount: Double?
}
