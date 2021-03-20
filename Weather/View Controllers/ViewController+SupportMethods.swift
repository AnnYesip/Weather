//
//  ViewController+SupportMethods.swift
//  Weather
//
//  Created by Ann Yesip on 20.03.2021.
//

import UIKit
import CoreLocation

extension ViewController {
    
    @objc func search() {
        presentAlertController(withTitle: "What the weather?", message: "Enter city name", style: .alert){ [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    @objc func currentLocation(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 66.0/255.0, green: 130.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 5.0/255.0, green: 50.0/255.0, blue: 109.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func updateInterfaceWith(weather: CurrentWeather){
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.currentData.text = weather.currentDataString
            self.temperatupe.text = "\(weather.temperatureString)°"
            self.feelsLike.text = "Feels like \(weather.feelsLikeTemperatureString)°"
            self.imageOfWeather.image = UIImage(systemName: weather.systemIconNameString)
            self.humidity.text = "humidity \n    \(weather.humidity)%" //влажность
            self.windSpeed.text = "wind speed \n     \(weather.windSpeedString) m/s"
            self.cloudiness.text = "cloudiness \n     \(weather.clouds) %"
            self.weatherComment.text = "\(weather.weatherDescriptionText)"
            self.tempMinMax.text = "\(weather.temperatureMinString)° / \(weather.temperatureMaxString)°"
            self.weatherData.removeAll()
            self.weatherData.append("deg   \(weather.degString)")
            self.weatherData.append("sunrise   \(weather.sunriseString)")
            self.weatherData.append("sunset   \(weather.sunsetString)")
            self.weatherData.append("pressure   \(weather.pressure)")
            self.tableView.reloadData()
            
        }
    }
    
    func presentAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField{ tf in
            tf.placeholder = cities.randomElement()
        }
        let find = UIAlertAction(title: "Find", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(find)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
   }
}
