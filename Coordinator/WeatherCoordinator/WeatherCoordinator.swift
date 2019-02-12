//
//  WeatherCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class WaetherCoordinator: Coordinator {
    private let weatherModuleFactory: WeatherModuleFactory
    private let router: Router
    
    init(router: Router, factory: WeatherModuleFactory) {
        self.router = router
        self.weatherModuleFactory = factory
    }
    
    override func start() {
        showWeather()
    }
    
    private func showWeather() {
        let weatherFlowOutput = weatherModuleFactory.makeWeather()
        router.setRootModule(weatherFlowOutput)
    }
}
