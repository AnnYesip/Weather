//
//  ViewController.swift
//  Weather
//
//  Created by Ann Yesip on 14.01.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UICollectionViewDelegate {
    

    
    let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
    
    var saveCities = [String]()
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
var networkWeatherManager = NetworkWeatherManager()
    
    var weatherData = [String]()
    
    // MARK:  - Setup Navigation Controller
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

        func setupNavigationController(){
            navigationController?.navigationBar.backgroundColor = .clear
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()

            
    //        buttons
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
      
     // MARK: - Interface

    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentData: UILabel = {
        let data = UILabel()
        data.translatesAutoresizingMaskIntoConstraints = false
        return data
    }()
    
    let weatherComment: UILabel = {
        let comment = UILabel()
        comment.translatesAutoresizingMaskIntoConstraints = false
        return comment
    }()
    
    
    let imageOfWeather: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        return weatherImage
    }()
    
    let temperatupe: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let tempMinMax: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    let feelsLike: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let humidity: UILabel = {
        let humidity = UILabel()
        humidity.translatesAutoresizingMaskIntoConstraints = false
        return humidity
    }()
    
    let windSpeed: UILabel = {
        let wind = UILabel()
        wind.translatesAutoresizingMaskIntoConstraints = false
        return wind
    }()
    
    let cloudiness: UILabel = {
        let cloudiness = UILabel()
        cloudiness.translatesAutoresizingMaskIntoConstraints = false
        return cloudiness
    }()
    
    let tableView: UITableView = {
        let table = UITableView.init()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 800)
        return scroll
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    


    // MARK: - ViewDidLoad and ViewWillAppear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupNavigationController()
        
        view.addSubview(scrollView)
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

        
        tableView.dataSource = self
        tableView.delegate = self
        scrollView.delegate = self
        
        currentData.isHidden = true
        stackView.isHidden = true
        tableView.isHidden = true
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
                self.tableView.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    self.updateInterfaceWith(weather: currentWeather)
                    self.currentData.isHidden = false
                    self.stackView.isHidden = false
                    self.tableView.isHidden = false
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                }
                
            }
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupCityNameLabel()
        setupImageOfWeather()
        setupCurrentData()
        setupWeatherComment()
        setupTemp()
        setupFeelsLike()
        setupHumidity()
        setupWindSpeed()
        setupCloudiness()
        setupStackView()
        setupTableView()
        setupScrollView()
        setupTempMinMax()
        setupIndicator()

    }
    
    
    
    // MARK:  - Update Interface
    
    func updateInterfaceWith(weather: CurrentWeather){
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.temperatupe.text = "\(weather.temperatureString)°"
            self.feelsLike.text = "Feels like \(weather.feelsLikeTemperatureString)°"
            self.imageOfWeather.image = UIImage(systemName: weather.systemIconNameString)
            self.humidity.text = "humidity \n    \(weather.humidity)%" //влажность
            self.windSpeed.text = "wind speed \n     \(weather.windSpeedString) m/s"
            self.cloudiness.text = "cloudiness \n     \(weather.clouds) %"
            self.weatherComment.text = "\(weather.weatherDescriptionText)"
            self.tempMinMax.text = "\(weather.temperatureMinString)° / \(weather.temperatureMaxString)°"
            
            self.weatherData.removeAll()
            self.weatherData.append("deg              \(weather.degString)")
            self.weatherData.append("sunrise          \(weather.sunriseString)")
            self.weatherData.append("sunset          \(weather.sunsetString)")
            self.weatherData.append("pressure       \(weather.pressure)")
            self.tableView.reloadData()
            
            
            
        }
        
        

    }
    

    
    
  
    // MARK: - Setup Backgroung
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 66.0/255.0, green: 130.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 5.0/255.0, green: 50.0/255.0, blue: 109.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}



