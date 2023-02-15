//
//  NetworkCostants.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation

struct NetworkCostants {
    static let baseURL = URL(string: "https://api.tomorrow.io/v4/weather")!
    static let apiKeyValue = getKey()
    
    static let defaultHeaders: [String: String] = [
        "accept": "application/json"
    ]
    
    static let parameters: [String: String] = [
        "apikey": getKey(),
        "location": "guarulhos"
    ]
    
    static func getKey() -> String {
        guard let key = getenv("apikey") else { return "" }
        return String(utf8String: key) ?? ""
    }
}
