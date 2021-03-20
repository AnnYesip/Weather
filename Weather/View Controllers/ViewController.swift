//
//  ViewController.swift
//  Weather
//
//  Created by Ann Yesip on 14.01.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UICollectionViewDelegate {
    
    var networkWeatherManager = NetworkWeatherManager()
    var weatherData = [String]()
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
        
    // MARK: - UI Declarations
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
        view.addSubview(scrollView)
        tableView.dataSource = self
        tableView.delegate = self
        scrollView.delegate = self
        
        setGradientBackground()
        
        setupScrollView()
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
        setupTempMinMax()
        setupIndicator()
        
        
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
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationController()
    }
    
}



