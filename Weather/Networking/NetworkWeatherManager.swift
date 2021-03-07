//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Ann Yesip on 17.01.2021.
//

import Foundation
import  CoreLocation

class NetworkWeatherManager{
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType){

        switch requestType {
        case .cityName(city: let city):
            guard let firstUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiId)&units=metric") else { return  }
            performRequest(withURLString: firstUrl)
            
            
        case .coordinate(let latitude, let longitude):
            guard let firstUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiId)&units=metric") else { return  }
            performRequest(withURLString: firstUrl)
            
        }
    }
    

    fileprivate func performRequest(withURLString url: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {

                do {
                    let currentWearherData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                    guard let currentWeather = CurrentWeather(currentWeatherData: currentWearherData) else { return }
                    self.onCompletion?(currentWeather)
                } catch let error as NSError {
                    print(error)
                }
               
            }
        }
        task.resume()
        
    }
    


}
