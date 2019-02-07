//
//  UIViewController+Extensions.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 07/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var ParentCoordinator = "ParentCoordinator"
    }
    
    weak var parentCoordinator: Coordinator? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ParentCoordinator) as? Coordinator
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ParentCoordinator, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
