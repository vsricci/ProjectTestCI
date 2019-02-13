//
//  WeatherModuleFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol WeatherModuleFactory {
    func makeWeather() -> WeatherView 
}
