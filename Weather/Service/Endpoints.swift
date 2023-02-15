//
//  Endpoints.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Moya

enum Endpoints {
    case current(String)
}

extension Endpoints: TargetType {
    var baseURL: URL {
        return NetworkCostants.baseURL
    }
    
    var path: String {
        switch self {
        case .current(_):
            return "realtime"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestParameters(parameters: NetworkCostants.parameters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return NetworkCostants.defaultHeaders
    }
}
