//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Ann Yesip on 17.01.2021.
//

import Foundation

struct NetworkWeatherManager{
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiId)&units=metric"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data){
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWearherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWearherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    
}



