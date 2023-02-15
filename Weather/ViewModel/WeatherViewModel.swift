//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import UIKit
import RxSwift
import RxRelay

protocol WeatherViewModelProtocol {
    var currentTemperature: BehaviorRelay<String> { get }
    func loadCurrentTemperature(_ location: String)
}

final class WeatherViewModel {
    private let service: ServiceProtocol
    private var bag = DisposeBag()
    
    var currentTemperature = BehaviorRelay<String>(value: "")
    
    init(service: ServiceProtocol = NetworkManager()) {
        self.service = service
    }
}

extension WeatherViewModel: WeatherViewModelProtocol {
    func loadCurrentTemperature(_ location: String) {
        service.performLoadCurrentTemperature(location: location)
            .map(WeatherModel.self)
            .subscribe(onSuccess: { response in
                guard let temperature = response.data?.values?.temperature else { return }
                self.currentTemperature.accept("\(temperature)°C")
                debugPrint(temperature)
            }, onFailure: { error in
                debugPrint(error)
            }).disposed(by: bag)
    }
}
