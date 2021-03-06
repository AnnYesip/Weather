//
//  CollectionViewCell.swift
//  Weather
//
//  Created by Ann Yesip on 05.03.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    class var reuseIdentifier: String {
        return "Identifier"
    }
//    var secondData = [SecondData]()
    
    //MARK: Declarations -
    
    private let currentDataOnCV: UILabel = {
        let data = UILabel()
        data.translatesAutoresizingMaskIntoConstraints = false
        return data
    }()
    
    private let minMaxTemperatupeOnCV: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let maxTemperatupeOnCV: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let weatherDescriptionOnCV: UILabel = {
        let comment = UILabel()
        comment.translatesAutoresizingMaskIntoConstraints = false
        return comment
    }()
    
    private let imageOfWeatherOnCV: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        return weatherImage
    }()
    
    //MARK: setup -
    
    func setupCurrentDataOnCV() {
        currentDataOnCV.textColor = .black
        currentDataOnCV.font = .systemFont(ofSize: 20)
        currentDataOnCV.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        currentDataOnCV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupMinMaxTemperature() {
        minMaxTemperatupeOnCV.textColor = .black
        minMaxTemperatupeOnCV.font = .systemFont(ofSize: 20)
        minMaxTemperatupeOnCV.topAnchor.constraint(equalTo: currentDataOnCV.topAnchor,constant: 35).isActive = true
        minMaxTemperatupeOnCV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    func setupWeatherDescription() {
        weatherDescriptionOnCV.numberOfLines = 0
        weatherDescriptionOnCV.textColor = .black
        weatherDescriptionOnCV.font = .systemFont(ofSize: 20)
        weatherDescriptionOnCV.topAnchor.constraint(equalTo: minMaxTemperatupeOnCV.topAnchor, constant: 35).isActive = true
        weatherDescriptionOnCV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    func setupImageOfWeatherOnCV() {
        imageOfWeatherOnCV.topAnchor.constraint(equalTo: weatherDescriptionOnCV.topAnchor, constant: 15).isActive = true
        imageOfWeatherOnCV.centerXAnchor.constraint(equalTo: weatherDescriptionOnCV.centerXAnchor).isActive = true
//        imageOfWeatherOnCV.transform = CGAffineTransform( scaleX: 6, y: 6)
        imageOfWeatherOnCV.tintColor = .white
    }

    
    
    
    
    //MARK: Initializer -
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(currentDataOnCV)
        contentView.addSubview(minMaxTemperatupeOnCV)
        contentView.addSubview(weatherDescriptionOnCV)
        contentView.addSubview(imageOfWeatherOnCV)

        setupCurrentDataOnCV()
        setupMinMaxTemperature()
        setupWeatherDescription()
        setupImageOfWeatherOnCV()
 
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTheCell(currentDataOnCV: String, minMaxTemperatupeOnCV: String, weatherDescriptionOnCV: String) {
        self.currentDataOnCV.text = currentDataOnCV
        self.maxTemperatupeOnCV.text = minMaxTemperatupeOnCV
        self.weatherDescriptionOnCV.text = weatherDescriptionOnCV
    }
    
    
    
}
