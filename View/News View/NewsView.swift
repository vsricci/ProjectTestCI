//
//  NewsView.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol NewsView: BaseView {
    var onItemSelected : ((ArticleViewModel) -> Void)? { get set }
}
