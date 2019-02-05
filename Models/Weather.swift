//
//  Weather.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class Weather: Decodable {
    
    var temperature: Dynamic<Double>?
    var temperatureMin: Dynamic<Double>?
    var temperatureMax: Dynamic<Double>?
    
    convenience init(temperature: Dynamic<Double>?, temperatureMin: Dynamic<Double>?, temperatureMax: Dynamic<Double>?) {
        self.init()
        self.temperature = temperature
        self.temperatureMin = temperatureMin
        self.temperatureMax = temperatureMax
    }
    
    enum CodingKeys : String, CodingKey {
        case temp
        case temp_min
        case temp_max
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let temperature = Dynamic(try container.decode(Double.self, forKey: .temp))
        let temperatureMax = Dynamic(try container.decode(Double.self, forKey: .temp_max))
        let temperatureMin = Dynamic(try container.decode(Double.self, forKey: .temp_min))
        self.init(temperature: temperature, temperatureMin: temperatureMin, temperatureMax: temperatureMax)
        
    }

    
}
extension Weather: CustomStringConvertible {
    var description: String {
        return "\(temperature) \(temperatureMin) \(temperatureMax)"
    }
}
