//
//  NetworkManager.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation
import Combine
import Alamofire
import Moya


let json = """
{
    "data": {
        "time": "2023-02-14T17:27:00Z",
        "values": {
            "cloudBase": 1.3,
            "cloudCeiling": null,
            "cloudCover": 44,
            "dewPoint": 19,
            "freezingRainIntensity": 0,
            "humidity": 54,
            "precipitationProbability": 0,
            "pressureSurfaceLevel": 919.25,
            "rainIntensity": 0,
            "sleetIntensity": 0,
            "snowIntensity": 0,
            "temperature": 29.19,
            "temperatureApparent": 30.5,
            "uvHealthConcern": 2,
            "uvIndex": 6,
            "visibility": 16,
            "weatherCode": 1101,
            "windDirection": 302.88,
            "windGust": 7.13,
            "windSpeed": 5.69
        }
    },
    "location": {
        "lat": -23.442893981933594,
        "lon": -46.52438735961914,
        "name": "Guarulhos, Região Imediata de São Paulo, Região Metropolitana de São Paulo, Região Geográfica Intermediária de São Paulo, São Paulo, Região Sudeste, Brasil",
        "type": "administrative"
    }
}

"""
protocol ServiceProtocol {
    // func performLoadCurrentTemperature()
    func requestCurrentTemperature(location: String) -> AnyPublisher<Response, MoyaError>
    func requestCurrent() -> AnyPublisher<WeatherModel, AFError>
}

final class NetworkManager {
    private let provider = MoyaProvider<Endpoints>()
    private let urlSession: URLSession
    private let baseURL: String = NetworkCostants.baseURL
    private var cancellable = Set<AnyCancellable>()
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    let defaultHeaders: [String: String] = [
        "accept": "application/json"
    ]
    
    let parameters: Parameters = [
        "apikey": "",
        "location": "guarulhos"
    ]
}

extension NetworkManager: ServiceProtocol {
    func requestCurrentTemperature(location: String)  -> AnyPublisher<Response, MoyaError> {
        provider.requestPublisher(.current(location))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func requestCurrent() -> AnyPublisher<WeatherModel, AFError> {
        AF.request("https://api.tomorrow.io/v4/weather/realtime", method: .get, parameters: parameters, headers: .init(defaultHeaders))
            
                .validate()
                    .publishDecodable(type: WeatherModel.self)
                    .value()
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
}
    
            //.responseData { response in
           // debugPrint(response)
           
           // let userDictionary = try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] ?? [:]
                 
          //  let value = try? JSONSerialization.data(withJSONObject: userDictionary, options: [])
           
          
//            let data:[String: Any] = userDictionary!["data"] as! [String : Any]
//            let values = data["values"]
//            debugPrint(values)
        
            
           
          //  debugPrint(valuesModel)
//            let jsonData = json.data(using: .utf8)!
//            let model: WeatherModel = try! JSONDecoder().decode(WeatherModel.self, from: jsonData)
            //   debugPrint(model)
//            let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: response.data!)
//
//           debugPrint(weatherModel)
//            let nsdata = NSData(data: response.data!)
//            debugPrint(nsdata)
            
 //       }
        
 //   }
//            .validate()
//            .publishDecodable(type: WeatherModel.self)
//            .value()
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
