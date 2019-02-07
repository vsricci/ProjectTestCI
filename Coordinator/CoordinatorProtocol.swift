//
//  CoordinatorProtocol.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol {
 
    func start()
    func stop()
    var childCoordinators : [String: CoordinatorProtocol] { get }
}
