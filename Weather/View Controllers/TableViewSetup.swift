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
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        return cell
    }
    
    // MARK: - setup Table View

    func setupTableView(){
        tableView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 70).isActive = true
        tableView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: 118).isActive = true
        tableView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }



}
