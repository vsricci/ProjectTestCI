//
//  NavigationCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 07/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class NavigationCoordinator: Coordinator {
    
    public override func start() {
        guard let rootViewController = self.presenter as? UINavigationController else {return}
        rootViewController.delegate = self
        super.start()
    }
    override func stop() {
        guard let rootViewController = self.presenter as? UINavigationController else {return}
        rootViewController.delegate = self
        super.stop()
    }
}

extension NavigationCoordinator: UINavigationControllerDelegate {
    
}
