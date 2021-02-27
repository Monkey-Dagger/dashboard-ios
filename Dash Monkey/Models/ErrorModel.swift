//
//  ErrorModel.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 21/02/21.
//

import Foundation
import SwiftUI

struct ErrorModel: Codable, Hashable, Identifiable {
    var id = UUID()
    var error_code: Int?
    var error_message: String?
}
