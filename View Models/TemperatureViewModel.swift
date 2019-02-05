//
//  TemperatureViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
class TemperatureViewModel {

    var city = ""
    var weatherURL = URL(string: urlString)
    var temperature: Temperature?
    
     func getTemperature() {
        print(city)
        print(weatherURL)
        let extractedExpr = Resource<Temperature>(url: weatherURL!) { data in
            
            let weather = try? JSONDecoder().decode(Temperature.self, from: data)
            return weather
        }
        Webservice().load(resouce: extractedExpr) {  result in
            if let temperature = result {
                self.temperature = temperature
                print(self.temperature?.main?.temperature)
            }
            
        }
    }
}
