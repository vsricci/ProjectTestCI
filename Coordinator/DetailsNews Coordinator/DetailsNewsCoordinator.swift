//
//  DetailsNewsCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 13/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class DetailsNewsCoordinator: Coordinator, DetailsNewsCoordinatorOutput {
    var isFinished: (() -> Void)?
    
    
    var router: Router
    var factory: NewsModuleFactory
    
    init(router: Router, factory: NewsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    
    override func start() {
       // showDetailsNews()
    }
    
   
}
