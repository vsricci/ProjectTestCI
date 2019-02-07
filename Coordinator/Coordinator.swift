//
//  Coordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class Coordinator: NSObject, CoordinatorProtocol {

    var parent: CoordinatorProtocol?
    
    public weak var rootViewController: UIViewController?
    
    public init(_ rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    var childCoordinators: [String : CoordinatorProtocol] = [:]
    
    public weak var presenter: UIViewController?
    
    init(presenter: UIViewController?) {
        self.presenter = presenter
    }
    
    func start() {
        childCoordinators[self.identifier] = self
        self.presenter?.parentCoordinator = self
    }
    
    func stop() {
        self.presenter?.parentCoordinator = nil
        self.childCoordinators.removeValue(forKey: self.identifier)
    }
    
    
}

