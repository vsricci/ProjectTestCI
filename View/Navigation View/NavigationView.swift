//
//  NavigationView.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

protocol NacigationView: class {
    var run: ((NavigationController) -> ())? { get set }
}
