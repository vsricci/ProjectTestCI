//
//  GoodWeatherCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit


protocol WatherListCoordinateDelegate {
    func test()
}


class WeatherListTableViewCoordinator : Coordinator {

    weak var navigationController: UINavigationController?
    
    lazy var weatherListViewModel : WeatherListViewModel? = {
        let vm = WeatherListViewModel()
        vm.weatherCoordinatorDelegate = self
        return vm
    }()

    override func start() {
        
    }
}
extension WeatherListTableViewCoordinator: WeatherListViewModelCoordinateDelegate {
    func next() {
        print("fghdghghfg")
    }
    
    
    
    
}
