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
        case condition
        case humidity
        case uvIndex = "uv"
        case feelsLike = "feelslike_c"
    }

    enum ConditionKeys: String, CodingKey {
        case text
        case icon
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try container.decode(Double.self, forKey: .temperature)
        humidity = try container.decode(Double.self, forKey: .humidity)
        uvIndex = try container.decode(Double.self, forKey: .uvIndex)
        feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        
        let conditionContainer = try container.nestedContainer(keyedBy: ConditionKeys.self, forKey: .condition)
        weatherCondition = try conditionContainer.decode(String.self, forKey: .text)
        iconURL = try conditionContainer.decode(String.self, forKey: .icon)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(uvIndex, forKey: .uvIndex)
        try container.encode(feelsLike, forKey: .feelsLike)
        
        var conditionContainer = container.nestedContainer(keyedBy: ConditionKeys.self, forKey: .condition)
        try conditionContainer.encode(weatherCondition, forKey: .text)
        try conditionContainer.encode(iconURL, forKey: .icon)
    }
}
