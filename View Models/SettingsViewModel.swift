//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 03/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation


enum Unit : String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}
struct SettingsViewModel {
    
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fahrenheit
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}

extension Unit {
    var displayName : String {
        get {
            switch (self) {
            case .celsius:
                return "celsius"
            case .fahrenheit:
                return "fahrenheit"
            }
        }
    }
}
