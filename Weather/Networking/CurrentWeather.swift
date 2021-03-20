//
//  CurrentWeather.swift
//  Weather
//
//  Created by Ann Yesip on 17.01.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let currentData: Int
    var currentDataString: String{
        let cd = setupData(data: currentData)
        return cd
    }
    
    let weatherDescriptionText: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let temperatureMin: Double
    var temperatureMinString: String {
        return String(format: "%.0f", temperatureMin)
    }
    
    let temperatureMax: Double
    var temperatureMaxString: String {
        return String(format: "%.0f", temperatureMax)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    let humidity: Int
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.0f", windSpeed)
    }
    
    let clouds: Int
    
    let conditionCode: Int
    
    var systemIconNameString: String{
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default:
            return "nosign"
        }
    }
    
    
    let sunrise: Int
    var sunriseString: String {

        let currentSunrise = setupData(data: sunrise)
        return currentSunrise
    }
    

    
    let sunset: Int
    var sunsetString: String {
        let currentSunset = setupData(data: sunset)
        return currentSunset
        }
    
    
    let pressure: Int
    var pressureString: String {
        return String(pressure)
    }
    
    let deg: Int
    var degString: String {
         String(deg)
    }
    

    func setupData( data: Int) -> String{
        let date = NSDate(timeIntervalSince1970: TimeInterval(data))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let currentSunrise = formatter.string(from: date as Date)
        return currentSunrise
    }

    
//    MARK: - Init
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        currentData = currentWeatherData.dt
        temperature = currentWeatherData.main.temp
        temperatureMin = currentWeatherData.main.tempMin
        temperatureMax = currentWeatherData.main.tempMax
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
        humidity = currentWeatherData.main.humidity
        windSpeed = currentWeatherData.wind.speed
        clouds = currentWeatherData.clouds.all
        weatherDescriptionText = currentWeatherData.weather.first!.main
        sunrise = currentWeatherData.sys.sunrise
        sunset = currentWeatherData.sys.sunset
        pressure = currentWeatherData.main.pressure
        deg = currentWeatherData.wind.deg
    }
 
}


