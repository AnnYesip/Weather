//
//  CollectionViewSetup.swift
//  Weather
//
//  Created by Ann Yesip on 06.02.2021.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  5
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth / 2.5, height: collectionHeight)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
 
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        
        
        cell.contentMode = .scaleAspectFit
        cell.layer.cornerRadius = 10

        cell.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
//        let wData = ViewController.secondData[indexPath.row]
//        let tempMax = wData.main.tempMax
//        let tempMin = wData.main.tempMin
//        let tempMinMax = "\(tempMax) / \(tempMin)"
//
//                wData.weather.forEach { (weather) in
//                    let wd = weather.weatherDescription
//
//
//                    cell.configureTheCell(currentDataOnCV: wData.dtTxt,
//                                          minMaxTemperatupeOnCV: tempMinMax,
//                                          weatherDescriptionOnCV: wd.rawValue)
//
//                }
//
//

//
//        let cv = list.dtTxt
//
//        list.weather.forEach { (weather) in
//            let wd = weather.weatherDescription
//
//
//            cell.configureTheCell(currentDataOnCV: cv,
//                                  minMaxTemperatupeOnCV: tempMinMax,
//                                  weatherDescriptionOnCV: wd.rawValue)
//
//        }
//
 
        
        
        
        
        return cell

    }

    //MARK: setupCollectionView -
    func setupCollectionView(){
        collertionView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        collertionView.layer.cornerRadius = 10
        collertionView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        collertionView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        collertionView.heightAnchor.constraint(equalTo: tableView.heightAnchor, constant: 100).isActive = true
        collertionView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        collertionView.accessibilityScroll(.right)

        
    }
    
    
    

    
}
