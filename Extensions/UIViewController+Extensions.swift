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

extension UIViewController : Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}


extension UIViewController {
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
}
