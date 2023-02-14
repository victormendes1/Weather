//
//  WeatherModel.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import Foundation

struct WeatherModel: Codable {
    var data: DataClass? // DataClass(time: Date(), values: .init(values: []))
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
    var freezingRainIntensity: Double
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






//    init?(coder: NSCoder) {
//        let cloudBase = coder.decodeDouble(forKey: PropertyKey.cloudBase)
//        let cloudCeiling = coder.decodeDouble(forKey: PropertyKey.cloudCeiling)
//        let cloudCover = coder.decodeDouble(forKey: PropertyKey.cloudCover)
//        let dewPoint = coder.decodeDouble(forKey: PropertyKey.dewPoint)
//        let freezingRainIntensity = coder.decodeDouble(forKey: PropertyKey.freezingRainIntensity)
//        let humidity = coder.decodeDouble(forKey: PropertyKey.humidity)
//        let precipitationProbability = coder.decodeDouble(forKey: PropertyKey.precipitationProbability)
//        let pressureSurfaceLevel = coder.decodeDouble(forKey: PropertyKey.pressureSurfaceLevel)
//        let rainIntensity = coder.decodeDouble(forKey: PropertyKey.rainIntensity)
//        let sleetIntensity = coder.decodeDouble(forKey: PropertyKey.sleetIntensity)
//        let snowIntensity = coder.decodeDouble(forKey: PropertyKey.snowIntensity)
//        let temperature = coder.decodeDouble(forKey: PropertyKey.temperature)
//        let temperatureApparent = coder.decodeDouble(forKey: PropertyKey.temperatureApparent)
//        let uvHealthConcern = coder.decodeDouble(forKey: PropertyKey.uvHealthConcern)
//        let uvIndex = coder.decodeDouble(forKey: PropertyKey.uvIndex)
//        let visibility = coder.decodeDouble(forKey: PropertyKey.visibility)
//        let weatherCode = coder.decodeDouble(forKey: PropertyKey.weatherCode)
//        let windDirection = coder.decodeDouble(forKey: PropertyKey.windDirection)
//        let windGust = coder.decodeDouble(forKey: PropertyKey.windGust)
//        let windSpeed = coder.decodeDouble(forKey: PropertyKey.windSpeed)
//
//        self.init()
//
//
//
//
//        struct PropertyKey {
//            static let cloudBase = "cloudBase"
//            static let cloudCeiling = "cloudCeiling"
//            static let cloudCover = "cloudCover"
//            static let dewPoint = "dewPoint"
//            static let freezingRainIntensity = "freezingRainIntensity"
//            static let humidity = "humidity"
//            static let precipitationProbability = "precipitationProbability"
//            static let pressureSurfaceLevel = "pressureSurfaceLevel"
//            static let rainIntensity = "rainIntensity"
//            static let sleetIntensity = "sleetIntensity"
//            static let snowIntensity = "snowIntensity"
//            static let temperature = "temperature"
//            static let temperatureApparent = "temperatureApparent"
//            static let uvHealthConcern = "uvHealthConcern"
//            static let uvIndex = "uvIndex"
//            static let visibility = "visibility"
//            static let weatherCode = "weatherCode"
//            static let windDirection = "windDirection"
//            static let windGust = "windGust"
//            static let windSpeed = "windSpeed"
//
