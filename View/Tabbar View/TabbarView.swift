//
//  TabbarView.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

protocol TabbarView: class  {

    var onNewsFlowSelect : ((UINavigationController) -> ())? { get set }
    var onTemperatureFlowSelect : ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
