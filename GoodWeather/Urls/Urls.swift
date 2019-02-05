//
//  Urls.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

var city = ""

var urlString: String {
    
    return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=89b756a3db10a8b505c9ca11724e9c46&units=imperial"
}

