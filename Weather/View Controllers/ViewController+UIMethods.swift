//
//  SetupViewElements.swift
//  Weather
//
//  Created by Ann Yesip on 16.01.2021.
//

import Foundation
import UIKit

extension ViewController {
    
    func setupNavigationController(){
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(search) )
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Current city",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(currentLocation))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
    }
    
    func setupScrollView(){
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.addSubview(cityNameLabel)
        scrollView.addSubview(imageOfWeather)
        scrollView.addSubview(currentData)
        scrollView.addSubview(weatherComment)
        scrollView.addSubview(temperatupe)
        scrollView.addSubview(tempMinMax)
        scrollView.addSubview(feelsLike)
        scrollView.addSubview(humidity)
        scrollView.addSubview(windSpeed)
        scrollView.addSubview(cloudiness)
        scrollView.addSubview(stackView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(activityIndicator)
    }
    
    
    func setupCityNameLabel() {
        cityNameLabel.textColor = .white
        cityNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameLabel.font = .boldSystemFont(ofSize: 40)
    }
    
    func setupTableView(){
        tableView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 80).isActive = true
        tableView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: 118).isActive = true
        tableView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.isHidden = true
    }
    
    func setupCurrentData(){
        currentData.textColor = .white
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
        imageOfWeather.topAnchor.constraint(equalTo: weatherComment.topAnchor, constant: 100).isActive = true
        imageOfWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        imageOfWeather.transform = CGAffineTransform( scaleX: 6, y: 6)
        imageOfWeather.tintColor = .white
    }
    
    func setupTemp(){
        temperatupe.textColor = .white
        temperatupe.font = .systemFont(ofSize: 90)
        temperatupe.topAnchor.constraint(equalTo: weatherComment.topAnchor, constant: 65).isActive = true
        temperatupe.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
    }
    
    
    func setupTempMinMax(){
        tempMinMax.textColor = .white
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
        stackView.isHidden = true
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
    
    func setupIndicator(){
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.color = .white
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
}
