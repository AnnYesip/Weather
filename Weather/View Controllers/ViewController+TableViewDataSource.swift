//
//  TableViewController.swift
//  Weather
//
//  Created by Ann Yesip on 16.01.2021.
//

import UIKit

extension ViewController: UITableViewDataSource {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = weatherData[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        return cell
    }
}
