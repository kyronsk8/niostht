//
//  Weather.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//


struct Weather: Codable {
    let temperature: Double
    let weatherCondition: String
    let humidity: Double
    let uvIndex: Double
    let feelsLike: Double
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case weatherCondition = "condition.text"
        case humidity
        case uvIndex = "uv"
        case feelsLike = "feelslike_c"
        case iconURL = "condition.icon"
    }
}
