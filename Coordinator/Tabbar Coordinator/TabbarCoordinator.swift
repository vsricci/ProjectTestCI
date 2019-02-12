//
//  TabbarCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class TabbarCoordinator: Coordinator {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
    
        tabbarView.onViewDidLoad = runWatherFlow()
        tabbarView.onTemperatureFlowSelect = runWatherFlow()
    }
    
    private func runWatherFlow() -> ((UINavigationController) -> ()){
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let weatherCoordinator = self.coordinatorFactory.makeWeatherCoordinator(navigationController: navigationController)
                self.addDependency(weatherCoordinator)
                weatherCoordinator.start()
            }
        }
    }
}
