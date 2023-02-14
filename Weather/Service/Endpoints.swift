//
//  Endpoints.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation
import Moya


let parameters: [String: String] = [
    "apikey": "",
    "location": "guarulhos"
]

enum Endpoints {
    case current(String)
    
}

extension Endpoints: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.tomorrow.io/v4/weather/")!
    }
    
    var path: String {
        switch self {
        case .current(let location):
            return "realtime" //?location=\(location)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        
    }
    
    var headers: [String : String]? {
        return NetworkCostants.defaultHeaders
    }
}

