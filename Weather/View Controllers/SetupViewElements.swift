//
//  SetupViewElements.swift
//  Weather
//
//  Created by Ann Yesip on 16.01.2021.
//

import Foundation
import UIKit

extension ViewController {
    
    func setupCityNameLabel() {
        cityNameLabel.textColor = .white
        cityNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.font = .boldSystemFont(ofSize: 40)
    }
    
    func setupCurrentData(){
        currentData.text = "today"
        currentData.textColor = .black
        currentData.font = .systemFont(ofSize: 20)
        currentData.topAnchor.constraint(equalTo: cityNameLabel.topAnchor,constant: 50).isActive = true
        currentData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupWeatherComment(){
        weatherComment.textColor = .white
        weatherComment.font = .boldSystemFont(ofSize: 25)
        weatherComment.topAnchor.constraint(equalTo: currentData.topAnchor, constant: 25).isActive = true
        weatherComment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    func setupImageOfWeather() {
//        imageOfWeather.backgroundColor = .systemGray
        imageOfWeather.topAnchor.constraint(equalTo: weatherComment.topAnchor, constant: 100).isActive = true
        imageOfWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        imageOfWeather.transform = CGAffineTransform( scaleX: 6, y: 6)
        imageOfWeather.tintColor = .white
    }
    
    func setupTemp(){
//        temperatupe.backgroundColor = .systemGray2
        temperatupe.textColor = .white
        temperatupe.font = .systemFont(ofSize: 90)
        temperatupe.topAnchor.constraint(equalTo: weatherComment.topAnchor, constant: 65).isActive = true
        temperatupe.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
    }
    
    
        func setupTempMinMax(){
            tempMinMax.textColor = .black
            tempMinMax.numberOfLines = 0
            tempMinMax.font = .systemFont(ofSize: 18)
            tempMinMax.topAnchor.constraint(equalTo: temperatupe.topAnchor, constant: 100).isActive = true
            tempMinMax.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        }
    
    func setupFeelsLike(){
        feelsLike.textColor = .white
        feelsLike.font = .systemFont(ofSize: 20)
        feelsLike.topAnchor.constraint(equalTo: temperatupe.topAnchor,constant: 130).isActive = true
        feelsLike.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupStackView(){
        stackView.topAnchor.constraint(equalTo: feelsLike.topAnchor,constant: 40).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        stackView.heightAnchor.constraint(equalTo: feelsLike.heightAnchor, constant: 35).isActive = true
        stackView.layer.cornerRadius = 10
        stackView.addSubview(humidity)
        stackView.addSubview(windSpeed)
        stackView.addSubview(cloudiness)
        stackView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
    }
    
    func setupHumidity(){
        humidity.numberOfLines = 0
        humidity.textColor = .white
        humidity.font = .systemFont(ofSize: 20)
        humidity.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5).isActive = true
        humidity.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: -110).isActive = true
    }
    
    func setupWindSpeed(){
        windSpeed.numberOfLines = 0
        windSpeed.textColor = .white
        windSpeed.font = .systemFont(ofSize: 20)
        windSpeed.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5).isActive = true
        windSpeed.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: 0).isActive = true
    }
    
    func setupCloudiness(){
        cloudiness.numberOfLines = 0
        cloudiness.textColor = .white
        cloudiness.font = .systemFont(ofSize: 20)
        cloudiness.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5).isActive = true
        cloudiness.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: 110).isActive = true
    }
    func setupScrollView(){
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}
