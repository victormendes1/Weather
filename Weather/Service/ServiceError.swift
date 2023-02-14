//
//  ServiceError.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation

enum ServiceError: Error {
    case serverError
    case unknownError
    case requestError
    
    var message: String {
        switch self {
        case .serverError:
            return "Server Error"
        case .unknownError:
            return "Unknown Error"
            
        case .requestError:
            return "Request Error"
        }
    }
}
