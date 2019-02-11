//
//  AppCoordinatorFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class AppCordinatorFactory : CoordinatorFactory {
    
    
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
