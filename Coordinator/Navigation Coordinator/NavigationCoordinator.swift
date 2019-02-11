//
//  NavigationCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import  UIKit

class NavigationCoordinator : Coordinator {
    
    private let navigationView : NacigationView
    private let coordinatorFactory: CoordinatorFactory
    
    init(coordinatorFactory: CoordinatorFactory, navigationView: NacigationView) {
        self.coordinatorFactory = coordinatorFactory
        self.navigationView = navigationView
    }
    
    override func start() {
     //   navigationView.run = run()
       
    }
    
//    private func run() -> ((NavigationController) -> ()) {
//        return { [unowned self] controller in
//            let coordinator = self.coordinatorFactory.makeNavigationCoordinator(navController: controller)
//            self.addDependency(coordinator)
//            coordinator.start()
//        }
//    }
    
}
