//
//  CoordinatorFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 09/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func makeTabBarCoordinator() -> (coordinator: Coordinator, toPresent: Presentable?)
    
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput
    
}
