//
//  SpotPriceViewModel.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 26/01/21.
//

import Foundation
import Combine
import Alamofire

class SpotPriceViewModel: ObservableObject {
    @Published var spotTokens = [SpotPriceModel]()
    
    init() {
        getSpotTokenPrices(search: "", currency: "usd")
    }
    
    func getSpotTokenPrices(search: String, currency: String) {
        var searchComp: [String] = []
        
        if search != "" {
            searchComp = search.components(separatedBy: ",")
        }
        
        let params: [String : Any] = ["key": covalentAPIKey, "tickers": searchComp, "quote-currency": currency]
        let apiRequest = AF.request(covalentAPI + "/v1/pricing/tickers/", method: .get, parameters: params)
        apiRequest.responseJSON { response in
            var resultVal = [SpotPriceModel]()
            if let data = response.value as? [String: Any] {
                if let res = data["data"] as? [String: Any] {
                    if let resData = res["items"] as? [[String: Any]] {
                        for item in resData {
                            var token = SpotPriceModel()
                            token.contract_decimals = item["contract_decimals"] as? Int ?? 0
                            token.contract_name = item["contract_name"] as? String ?? ""
                            token.contract_ticker_symbol = item["contract_ticker_symbol"] as? String ?? ""
                            token.contract_address = item["contract_address"] as? String ?? ""
                            token.logo_url = item["logo_url"] as? String ?? ""
                            token.quote_rate = item["quote_rate"] as? Double ?? 0.0
                            token.rank = item["rank"] as? Int ?? 0

                            resultVal.append(token)
                        }
                    }
                }
            }
            self.spotTokens = resultVal
        }
    }
}
