//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 03/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource : NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    
    private var weatherListViewModel: WeatherListViewModel
    
     init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(self.cellIdentifier) not found")
        }
        
        let weatherViewModel = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherViewModel.name.value
        cell.temperatureLabel.text = weatherViewModel.main.temperature?.value.formatAsDegree
        
        return cell
    }
    
    
}
