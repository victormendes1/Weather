//
//  WeatherModel.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation

struct WeatherModel: Codable {
    var data: DataClass?
    let location: Location?
}

// MARK: - DataClass
struct DataClass: Codable {
    let time: String?
    let values: Details?
}

struct Details: Codable {
    var cloudBase: Double?
    var cloudCeiling: Double?
    var cloudCover: Double?
    var dewPoint: Double?
    var freezingRainIntensity: Double?
    var humidity: Double?
    var precipitationProbability: Double?
    var pressureSurfaceLevel: Double?
    var rainIntensity: Double?
    var sleetIntensity: Double?
    var snowIntensity: Double?
    var temperature: Double?
    var temperatureApparent: Double?
    var uvHealthConcern: Double?
    var uvIndex: Double?
    var visibility: Double?
    var weatherCode: Double?
    var windDirection: Double?
    var windGust: Double?
    var windSpeed: Double?
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double?
    let name, type: String?
}
