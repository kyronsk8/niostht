//
//  WeatherResponse.swift
//  WeatherTrackerNooro
//
//  Created by Kyron Weaver on 1/17/25.
//


struct WeatherResponse: Codable {
    let location: City
    let current: Weather
}