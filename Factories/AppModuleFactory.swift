//
//  AppModuleFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class AppModuleFactory : AuthModuleFactory, WeatherModuleFactory, NewsModuleFactory{
    func makeADetailsNewsView(article: ArticleViewModel) -> DetailsNewView {
        let item = DetailsNewsViewController.controllerFromStoryboard(.main)
        item.articleViewModel = article
        return item
    }
    
 
    func makeNews() -> NewsView {
        return NewListTableViewController.controllerFromStoryboard(.newList)
    }
    
    func makeWeather() -> WeatherView {
        return WeatherListTableViewController.controllerFromStoryboard(.main)
    }
    
    func makeSignUp() -> SignUpView {
        return SignUpViewController.controllerFromStoryboard(.auth)
    }
    
    func makeRegister() -> RegisterView {
        return RegisterViewController.controllerFromStoryboard(.auth)
    }
    
}
