//
//  ViewCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 07/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class ViewCoordinator : Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.parentCoordinator = self
        guard let nav = self.rootViewController as? UINavigationController else { return }
        nav.pushViewController(vc, animated: true)
        super.start()
    }
}
