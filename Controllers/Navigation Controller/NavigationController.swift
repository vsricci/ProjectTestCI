//
//  NavigationController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation
import UIKit

class NavigationController : UINavigationController, NacigationView {
    var run: ((NavigationController) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        self.navigationController?.navigationBar.barTintColor = .red
      //  if let controller = self.navigationController?.viewControllers.first  {
            // run(NavigationController(rootViewController: <#T##UIViewController#>))
      //  }
       
    }
    
}

extension NavigationController : UINavigationControllerDelegate {
    
}
