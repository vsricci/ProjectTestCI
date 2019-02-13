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
        tabbarView.onNewsFlowSelect = runNewsFlow()
    }
    
    private func runWatherFlow() -> ((UINavigationController) -> ()){
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let weatherCoordinator = self.coordinatorFactory.makeWeatherCoordinator(navigationController: navigationController)
                navigationController.navigationBar.barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
            navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                self.addDependency(weatherCoordinator)
                weatherCoordinator.start()
            }
        }
    }
    
    private func runNewsFlow() -> ((UINavigationController) -> ()){
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let newsCoordinator = self.coordinatorFactory.makeNewsCoordinator(navigationController: navigationController)
                self.addDependency(newsCoordinator)
                newsCoordinator.start()
            }
        }
    }
}
