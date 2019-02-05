//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%0.f°",self)
    }
}
