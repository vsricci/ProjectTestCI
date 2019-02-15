//
//  AppCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
    
//        let userDefaults = UserDefaults.standard
//        if let user = userDefaults.value(forKey: "unit") as? String {
//            print(user)
//          //  self.navigationCoordinator = setupNavigationCoordinatorWithWather()
//            //self.navigationCoordinator = setupNavigationCoordinatorWithGoodNews()
//        }
//        else {
//           // self.navigationCoordinator = setupNavigationCoordinatorWithGoodNews()
//        }
        //runRootNavigation()
        runAuthFlow()
        
    }
    
    private func runAuthFlow() {
        var coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.isFinished = { [ weak self, weak coordinator] in
            self?.start()
            self?.removeDependency(coordinator)
            self?.runTabBarFlow()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runTabBarFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabBarCoordinator()
        
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
    

    
    
    
   
//    func setupNavigationCoordinatorWithWather()  -> NavigationCoordinator {
//
//        let navigationController = UINavigationController(rootViewController: WeatherListTableViewController())
//        navigationController.navigationBar.barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
//        navigationController.navigationBar.tintColor = .white
//        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//        navigationCoordinator.start()
//
//        return navigationCoordinator
//    }
//
//    func setupNavigationCoordinatorWithGoodNews() -> NavigationCoordinator {
//
//        let navigationController = UINavigationController(rootViewController: NewListTableViewController())
//         navigationController.navigationBar.barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
//        navigationController.navigationBar.tintColor = .white
//        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        self.rootViewController = navigationController
//        self.window.rootViewController = self.rootViewController
//
//        let navigationCoordinator = NavigationCoordinator(presenter: navigationController)
//        navigationCoordinator.start()
//
//        return navigationCoordinator
//    }
}
