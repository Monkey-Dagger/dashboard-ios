//
//  TxnViewModel.swift
//  Dash Monkey
//
//  Created by Shreyas Papinwar on 28/02/21.
//
import Foundation
import Combine
import Alamofire

class TxnViewModel: ObservableObject {
    @Published var txns = [TxnModel]()
    
    func getAllBaseTxn(chainID:String, address:String, currency:String) {
      let url:String = covalentAPI + "/v1/" + chainID + "/address/" + address + "/transactions_v2/"

      let params:[String:Any] = [
        "key": covalentAPIKey,
        "quote-currency": currency.lowercased(),
        "no-logs": true
      ]

      let req = AF.request(
        url,
        method: .get,
        parameters: params
      )

      req.responseJSON { res in
        var txns: [TxnModel] = []
        if let json = res.value as? [String:Any] {
          if let data = json["data"] as? [String:Any] {
            if let items = data["items"] as? [[String:Any]] {
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
              for item in items {
                if item["to_address"] as? String != address {
                    continue
                }
                // else
                var txn = TxnModel()
                
                // txn stuff
                txn.block_signed_at = dateformatter.date(from: (item["block_signed_at"] as? String)!)!
                txn.tx_hash = item["tx_hash"] as? String
                txn.tx_offset = item["tx_offset"] as? Int
                txn.success = item["successful"] as? Bool
                txn.from_address = item["from_address"] as? String
                txn.to_address = item["to_address"] as? String
                txn.from_address_label = item["from_address_label"] as? String
                txn.to_address_label = item["to_address_label"] as? String
                
                txn.amount = Double(item["value"] as? String ?? "0")
                txn.amount! /= pow(10, 18) // hard coded oh no
                txn.amount_in_quote = item["value_quote"] as? Double

                // gas stuff
                txn.gas_offered = item["gas_offered"] as? Double
                txn.gas_price = item["gas_price"] as? Double
                txn.gas_spent = item["gas_spent"] as? Double
                txn.gas_spent_quote = item["gas_quote"] as? Double
                txn.gas_rate_quote = item["value_quote"] as? Double

                txns.append(txn)
              }
            }
          } else { // if json["data"] == null
            print("Error retriving balances - \(json)")
          }
        }
        self.txns.append(contentsOf: txns)
      }
    }
    
    func getTokenTransfers(chainID:String, address:String, currency:String, contract:String) {
      let url:String = covalentAPI + "/v1/" + chainID + "/address/" + address + "/transfers_v2/"

      let params:[String:Any] = [
        "key": covalentAPIKey,
        "quote-currency": currency.lowercased(),
        "contract-address": contract
      ]

      let req = AF.request(
        url,
        method: .get,
        parameters: params
      )

      req.responseJSON { res in
        var txns:[TxnModel] = []
        if let json = res.value as? [String:Any] {
          if let data = json["data"] as? [String:Any] {
            if let items = data["items"] as? [[String:Any]] {
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
              for item in items {
                var txn = TxnModel()

                // gas stuff
                txn.gas_offered = item["gas_offered"] as? Double
                txn.gas_price = item["gas_price"] as? Double
                txn.gas_spent = item["gas_spent"] as? Double
                txn.gas_spent_quote = item["gas_quote"] as? Double
                txn.gas_rate_quote = item["value_quote"] as? Double
                
                // txn stuff
                txn.block_signed_at = dateformatter.date(from: (item["block_signed_at"] as? String)!)!
                txn.tx_hash = item["tx_hash"] as? String
                txn.tx_offset = item["tx_offset"] as? Int
                txn.success = item["successful"] as? Bool
                
                if let transfers = item["transfers"] as? [[String:Any]] {
                    if transfers.count > 1 {
                        print("multiple transfers in same block; currently unsuported")
                        continue
                    }
                    // else transfer info
                    txn.from_address = transfers[0]["from_address"] as? String
                    txn.to_address = transfers[0]["to_address"] as? String
                    txn.from_address_label = transfers[0]["from_address_label"] as? String ?? ""
                    txn.to_address_label = transfers[0]["to_address_label"] as? String ?? ""
                    
                    txn.contract_in_quote = transfers[0]["quote_rate"] as? Double
                    txn.contract_decimals = transfers[0]["contract_decimals"] as? Int
                    
                    txn.amount = Double(transfers[0]["delta"] as? String ?? "0")
                    txn.amount! /= pow(10, Double(transfers[0]["contract_decimals"] as? Int ?? 0))
                    txn.amount_in_quote = transfers[0]["delta_quote"] as? Double
                    
                    txns.append(txn)
                } else {
                    print("no transfers associated with this hash - \(item["tx_hash"] ?? "idk-man-no-hash-also")")
                }
              }
            }
          } else { // if json["data"] == null
            print("Error retriving trasnfers - \(json)")
          }
        }
        self.txns.append(contentsOf: txns)
      }
    }
}
