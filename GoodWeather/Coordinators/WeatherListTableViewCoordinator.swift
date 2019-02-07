//
//  GoodWeatherCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewCoordinator : Coordinator {
    
    var navController : UINavigationController?
   
    override func start() {
        
            let weatherListTableViewController = WeatherListTableViewController()
            let navController = UINavigationController(rootViewController: weatherListTableViewController)
            self.navController = navController
    }
}

