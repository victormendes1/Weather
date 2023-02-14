//
//  NetworkCostants.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation

struct NetworkCostants {
    static let baseURL: String = "https://api.tomorrow.io/v4/weather/realtime"
    static let apiKeyValue = ""
    static let defaultHeaders: [String: String] = [
        "accept": "application/json",
      // "apikey": apiKeyValue
    ]
    
    static let parameters: [String: Any] = [
        "apikey": "",
        "location": "guarulhos"
    ]
    
}
