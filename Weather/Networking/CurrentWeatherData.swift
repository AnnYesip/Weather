//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Ann Yesip on 17.01.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds2
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds2: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon,
        lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp,
        feelsLike,
        tempMin,
        tempMax: Double
    let pressure,
        humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure,
             humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id,
             main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
