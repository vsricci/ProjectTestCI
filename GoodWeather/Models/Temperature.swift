//
//  Temperature.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class Temperature: Decodable {
    var name: String?
    var main: Weather?
    
    
    convenience init(main: Weather, name: String) {
        self.init()
        self.main = main
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case main
        case name
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let main = try container.decode(Weather.self, forKey: .main)
        let name = try container.decode(String.self, forKey: .name)
        self.init(main: main, name: name)
        
    }
    
    
}
extension Temperature: CustomStringConvertible {
    var description: String {
        return "\(main) \(name)"
    }
}
