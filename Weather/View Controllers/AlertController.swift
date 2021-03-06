//
//  AlertController.swift
//  Weather
//
//  Created by Ann Yesip on 17.01.2021.
//

import Foundation
import UIKit

extension ViewController{
    

    
    func presentAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField{ tf in
            tf.placeholder = self.cities.randomElement()
        }
        let find = UIAlertAction(title: "Find", style: .default) { action in
            let textField = alert.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20") // соединяем строку при таких городах как New York
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(find)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
   }
    
    
    
    
    
}
