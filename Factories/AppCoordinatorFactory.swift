//
//  AppCoordinatorFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class AppCordinatorFactory : CoordinatorFactory {
    
    func makeWeatherCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let coordinator = WaetherCoordinator(router: router(navigationController), factory: AppModuleFactory())
        return coordinator
    }
    
    func makeWeatherCoordinator() -> Coordinator {
        return makeWeatherCoordinator(navigationController: nil)
    }
    
    func makeNewsCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let coordinator = NewsCoordinator(router: router(navigationController), factory: AppModuleFactory(), mainCoordinator: AppCordinatorFactory())
        return coordinator
    }
    
    func makeNewsCoordinator() -> Coordinator {
        return makeNewsCoordinator(navigationController: nil)
    }
    
    func makeTabBarCoordinator() -> (coordinator: Coordinator, toPresent: Presentable?) {
        let controller = TabbarController.controllerFromStoryboard(.main)
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: self)
        return (coordinator, controller)
    }
    
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        
        let coordinator = AuthCoordinator(router: router, authModuleFactory: AppModuleFactory())
        return coordinator
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        return AppRouter(rootController: navController ?? UINavigationController())
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.auth) }
    }
    
    
}
