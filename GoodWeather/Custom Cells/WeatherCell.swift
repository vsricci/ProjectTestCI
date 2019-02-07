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
     var cityNameLabel: UILabel = UILabel()
     var temperatureLabel: UILabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cityNameLabel.tintColor = UIColor.black
        cityNameLabel.numberOfLines = 1
        
        self.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cityNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        temperatureLabel.tintColor = UIColor.black
        temperatureLabel.textAlignment = .right
        temperatureLabel.numberOfLines = 1
        
        self.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        temperatureLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func configure(vm : WeatherViewModel) {
        cityNameLabel.text = vm.name?.value
        temperatureLabel.text = vm.main?.temperature?.value.formatAsDegree
    }
}
