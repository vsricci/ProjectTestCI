//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 30/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell : UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(vm : WeatherViewModel) {
        cityNameLabel.text = vm.name?.value
        temperatureLabel.text = vm.main?.temperature?.value.formatAsDegree
    }
}
