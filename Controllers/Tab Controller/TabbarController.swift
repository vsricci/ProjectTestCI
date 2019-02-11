//
//  TabbarController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController, TabbarView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
        }
    }
}

extension TabbarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            print("controller one")
        }
    }
}
