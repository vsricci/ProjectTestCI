//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 31/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherListViewModelCoordinateDelegate {
    func next()
    
}


class WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    var weatherCoordinatorDelegate : WeatherListViewModelCoordinateDelegate? = nil
    
    
    
    func addWeatherViewModel(vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
     func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
     func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    private func toCelsius() {
        
        weatherViewModels =  weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.main?.temperature?.value = ((weatherModel.main?.temperature?.value ?? 0.0) - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        
        weatherViewModels =  weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.main?.temperature?.value = ((weatherModel.main?.temperature?.value ?? 0.0) * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

// Type Eraser

class Dynamic<T>: Decodable where T: Decodable {
    
    typealias Listener = (T) -> ()
    var listener : Listener?
    
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys : CodingKey {
        case value
    }
    
}

class WeatherViewModel: Decodable {
    var name: Dynamic<String>?
    var main: Weather?
    
    convenience init(name: Dynamic<String>?, main: Weather?) {
        self.init()
        self.name = name
        self.main = main
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        let name = Dynamic(try container.decode(String.self, forKey: .name))
        let  main = try container.decode(Weather.self, forKey: .main)
        self.init(name: name, main: main)
    }
    
    private enum CodingKeys : String, CodingKey {
        case name
        case main = "main"
    }
}

extension WeatherViewModel: CustomStringConvertible {
    var description: String {
        return "\(name) \(main)"
    }
}

extension WeatherListViewModel: WatherListCoordinateDelegate, WeatherListViewModelCoordinateDelegate {
    func next() {
        print("fgfgfdgdfdfgf")
    }
    
    func test() {
        print("teste")
        weatherCoordinatorDelegate?.next()
    }
    
    
}
