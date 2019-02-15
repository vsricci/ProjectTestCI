//
//  DetailsNewsCoordinatorOutput.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 13/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol DetailsNewsCoordinatorOutput {
    var isFinished: (() -> Void)? { get set }
}
