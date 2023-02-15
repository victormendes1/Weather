//
//  NetworkManager.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import RxSwift
import Moya

protocol ServiceProtocol {
    func performLoadCurrentTemperature(location: String) -> Single<Response>
}

final class NetworkManager {
    private let provider = MoyaProvider<Endpoints>()
    private let bag = DisposeBag()
}

extension NetworkManager: ServiceProtocol {
    func performLoadCurrentTemperature(location: String) -> Single<Response> {
        provider.rx.request(.current(location))
    }
}

struct WeatherResponse {
    let weatherModel: WeatherModel?
    let error: ServiceError?
}
