//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//


import Combine
import UIKit


protocol WeatherViewModelProtocol {
    func loadCurrentTemperature()
    var currentTemperature: AnyPublisher<String, ServiceError> { get set }
    
    var currentTemperature1: CurrentValueSubject<String, Never> { get set }
    
}

final class WeatherViewModel {
    let service: ServiceProtocol
    var currentTemperature: AnyPublisher<String, ServiceError> = Empty(completeImmediately: false)
        .eraseToAnyPublisher()
    
    var currentTemperature1 = CurrentValueSubject<String, Never>("")
    
    private var cancelables: Set<AnyCancellable> = []
    init(service: ServiceProtocol = NetworkManager()) {
        self.service = service
    }
}

extension WeatherViewModel: WeatherViewModelProtocol {
    func loadCurrentTemperature() {
        service.requestCurrentTemperature(location: "Guarulhos")
            .catch { error in
                return Fail.init(error: ServiceError.requestError).eraseToAnyPublisher()
            }
            .map { $0.data }
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .mapError { error -> ServiceError in
                if let decodingError = error as? DecodingError {
                    let errorMessage = (decodingError as NSError).debugDescription
                    debugPrint(errorMessage)
                    return ServiceError.unknownError
                }
                return ServiceError.unknownError
            }
            .eraseToAnyPublisher()
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                debugPrint(error)
            } receiveValue: { response in
                guard let temperature = response.data?.values?.temperature else { return }
                 let formattedTemperature = "\(temperature)°C"
                self.currentTemperature1.send(formattedTemperature)
                self.currentTemperature.append(formattedTemperature)
                 //   .eraseToAnyPublisher()
            }
            
            .store(in: &cancelables)
        
        
        
        //            .mapError { _ -> ServiceError in
        //                return ServiceError.unknownError
        //            }
        //
        //            .map { $0.data }
        //            .decode(type: WeatherModel.self, decoder: JSONDecoder())
        //            .mapError { error -> Never in
        //                if let decodingError = error as? DecodingError {
        //                    let errorMessage = (decodingError as NSError).debugDescription
        //                    return ServiceError.decodingError(errorMessage)
        //                }
        //                return ServiceError.unknownError(description: error.localizedDescription)
        //            }
        //            .eraseToAnyPublisher()
        //            .assign(to: &currentTemperature)
        ////
        //            .sink { completion in
        //                debugPrint(completion)
        //            } receiveValue: { response in
        //                debugPrint(response)
        //
        //                guard let model: WeatherModel = try? JSONDecoder().decode(WeatherModel.self, from: response.data) else { return }
        //
        //            }
        //  .store(in: &cancelables)
        
        //        service.requestCurrent()
        //            .sink { completion in
        //                debugPrint(completion)
        //            } receiveValue: { response in
        //                debugPrint(response)
        //            }
        //            .store(in: &cancelables)
        
    }
}
