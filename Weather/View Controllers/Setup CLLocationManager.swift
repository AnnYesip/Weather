//
//  Setup CLLocationManager.swift
//  Weather
//
//  Created by Ann Yesip on 06.02.2021.
//

import Foundation
import CoreLocation

// MARK: - Setup CLLocationManager

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
        

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    
}
